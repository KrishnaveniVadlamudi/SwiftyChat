//
//  LoginViewController.swift
//  SwiftyChat
//
//  Created by Sunkara on 5/5/23.
//

import UIKit

class LoginViewController: UIViewController {

    private let scrollView: UIScrollView  = {
        print(#function)
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView : UIImageView  = {
        print(#function)
        let imageView = UIImageView()
        imageView.image = UIImage(named:"message")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField : UITextField  =  {
        print(#function)
        let emailField = UITextField()
        emailField.autocapitalizationType = .none
        emailField.autocorrectionType = .no
        emailField.returnKeyType = .continue
        emailField.layer.cornerRadius = 12
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        emailField.layer.borderWidth = 1
        emailField.placeholder = "Email Address...."
        emailField.leftView = UIView(frame: CGRect(x:0,y:0,width:5, height:0))
        emailField.leftViewMode = .always
        emailField.backgroundColor = .white
        return emailField
    }()
    
    private let pwdField : UITextField   = {
        let pwdField = UITextField()
        pwdField.autocapitalizationType = .none
        pwdField.autocorrectionType = .no
        pwdField.returnKeyType = .continue
        pwdField.layer.cornerRadius = 12
        pwdField.layer.borderColor = UIColor.lightGray.cgColor
        pwdField.layer.borderWidth = 1
        pwdField.placeholder = "Password...."
        pwdField.isSecureTextEntry = true
        pwdField.leftView = UIView(frame: CGRect(x:0,y:0,width:5, height:0))
        pwdField.leftViewMode = .always
        pwdField.backgroundColor = .white
        return pwdField
    }()
    
    private let loginButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.backgroundColor = .link
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.masksToBounds = true
        btn.titleLabel?.font = .systemFont(ofSize: 20,weight: .bold)
      
        return btn
    }()
    
  override func viewDidLoad() {
        super.viewDidLoad()
      print(#function)
        title = "Login"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style:.done,
                                                            target:self,
                                                            action:#selector(didTapRegister))
      
      loginButton.addTarget(self, action: #selector(loginBtnTapped),
                            for: .touchUpInside)
      emailField.delegate = self
      pwdField.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
       scrollView.addSubview(pwdField)
        scrollView.addSubview(loginButton)
        
      

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        
        imageView.frame = CGRect(x:(scrollView.width/2),
                                 y:40,
                                 width:size,
                                height: size)
        
        emailField.frame = CGRect(x:30,
                                  y:imageView.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        pwdField.frame = CGRect(x:30,
                                  y:emailField.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        loginButton.frame = CGRect(x:30,
                                  y:pwdField.bottom + 20,
                                  width:scrollView.width - 60,
                                height: 50)
        
        
        
    }
    
    @objc private func loginBtnTapped() {
        
        emailField.resignFirstResponder()
        pwdField.resignFirstResponder()
        
        guard let email = emailField.text, let password = pwdField.text ,
              !email.isEmpty, !password.isEmpty ,password.count >= 6 else {
                alertUserLoginError()
            return
        }
        
       //FireBase Login
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "oops...", message: "Please enter all the information too", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated:  true)
    }
    
    @objc private func didTapRegister() {
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
    }
    

 

}
extension LoginViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            pwdField.becomeFirstResponder()
        }
        else  if textField == pwdField {
            loginBtnTapped()
        }
        
     
        return true
    }
    
}
