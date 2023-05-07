//
//  ViewController.swift
//  SwiftyChat
//
//  Created by Sunkara on 5/5/23.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        let isLoggedIn = UserDefaults.standard.bool(forKey:"logged_in")
        
       if !isLoggedIn {
            let vc  = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
            
        }
    }

}

