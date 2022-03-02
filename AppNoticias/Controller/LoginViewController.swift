//
//  LoginViewController.swift
//  AppNoticias
//
//  Created by Carlos Carmo on 23/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupLabelPressed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action:  #selector(handleTap))
        signupLabelPressed.isUserInteractionEnabled = true
        signupLabelPressed.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // TODO: Check current user
    }
    
    @objc
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let signUpController = SignUpController()
        
        // TODO: delegate

        self.present(signUpController, animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
             
        if validateTextField() {
            dispatchAlert(nil, message: "Check your login was completed correctly.")
        } else {
            guard let email = userTextField.text, !email.isEmpty else { return }
            guard let password = passwordTextField.text, !password.isEmpty else { return }
            
            // TODO: SignIn user
        }
    }
    
    private func completeLogin() {
        DispatchQueue.main.async {
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
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

// TODO: delegate extension
