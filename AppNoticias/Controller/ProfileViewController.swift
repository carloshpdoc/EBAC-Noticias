//
//  ProfileViewController.swift
//  AppNoticias
//
//  Created by Carlos Carmo on 02/03/22.
//

import Foundation
import UIKit
import Firebase

class ProfileViewController: UIViewController  {
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBAction func logoutAction(_ sender: Any) {
       // TODO Logout
        do {
            try Auth.auth().signOut()
            let loginViewController = self.storyboard?.instantiateInitialViewController()
            self.present(loginViewController!, animated: true, completion: nil)

        } catch let signOutError {
            print("signOutError: \(signOutError)")
            dispatchAlert("Error", message: signOutError.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    func setupButton() {
        logout.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        logout.layer.cornerRadius = 5
        logout.titleLabel?.font = .systemFont(ofSize: 14)
        logout.setTitleColor(.white, for: .normal)
        logout.setTitle("Sair", for: .normal)

        // TODO display email
        let userEmail = Auth.auth().currentUser?.email
        userEmailLabel.text = userEmail
    }
}
