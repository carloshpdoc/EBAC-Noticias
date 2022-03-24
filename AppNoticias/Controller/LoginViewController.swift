//
//  LoginViewController.swift
//  AppNoticias
//
//  Created by Carlos Carmo on 23/11/21.
//

import UIKit
import Firebase
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLabelPressed: UILabel!
    
    var dataController: DataController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleTap))
        signupLabelPressed.isUserInteractionEnabled = true
        signupLabelPressed.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if Auth.auth().currentUser != nil {
            self.completeLogin()
        }
    }
    
    @objc
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let signUpController = SignUpController()
        // TODO: delegate
        signUpController.delegate = self

        self.present(signUpController, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
             
        if validateTextField() {
            dispatchAlert(nil, message: "Check your login was completed correctly.")
        } else {
            guard let email = userTextField.text, !email.isEmpty else { return }
            guard let password = passwordTextField.text, !password.isEmpty else { return }
            
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { [self] (user, error) in
                
                if error != nil {
                    dispatchAlert(nil, message: "Falhou para logar o usuario com email e senha")
                }
                
                print("Yes login feito!")
                
                completeLogin()
            })
        }
    }
    
    private func completeLogin() {
        DispatchQueue.main.async {
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
            
            let rootViewController = controller.topViewController as! UITabBarController
            
            let mainTableViewController = rootViewController.viewControllers![0] as! MainTableViewController
            
            mainTableViewController.dataController = self.dataController
            
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    private func validateTextField() -> Bool {
        if userTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            return true
            
        } else {
            return false
        }
    }
}

// TODO: delegate
extension LoginViewController: SignUpControllerDelegate {
    func didSignUpComplete() {
        completeLogin()
    }
}
