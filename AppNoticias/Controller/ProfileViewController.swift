//
//  ProfileViewController.swift
//  AppNoticias
//
//  Created by Carlos Carmo on 02/03/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController  {
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBAction func logoutAction(_ sender: Any) {
       // TODO Logout
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

    }
}
