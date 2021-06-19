//
//  ViewController.swift
//  Messenger
//
//  Created by Юлия Караневская on 10.05.21.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateUser()

    }
    
    private func validateUser() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let controller = LoginViewController()
            let navigation = UINavigationController(rootViewController: controller)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: false)
        }
    }


}

