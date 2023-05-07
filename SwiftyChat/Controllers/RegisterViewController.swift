//
//  RegisterViewController.swift
//  SwiftyChat
//
//  Created by Sunkara on 5/5/23.
//

import UIKit

class RegisterViewController: UIViewController {


    private let scrollView: UIScrollView  = {
        print(#function)
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView : UIImageView  = {
        print(#function)
        let imageView = UIImageView()
        imageView.image = UIImage(named:"pesron")
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let firstNameField : UITextField  =  {
        print(#function)
        let filed = UITextField()
        filed.autocapitalizationType = .none
        filed.autocorrectionType = .no
        filed.returnKeyType = .continue
        filed.layer.cornerRadius = 12
        filed.layer.borderColor = UIColor.lightGray.cgColor
        filed.layer.borderWidth = 1
        filed.placeholder = "Email Address...."
        filed.leftView = UIView(frame: CGRect(x:0,y:0,width:5, height:0))
        filed.leftViewMode = .always
        filed.backgroundColor = .white
        return filed
    }()
    private let lastNameField : UITextField  =  {
        print(#function)
        let filed = UITextField()
        filed.autocapitalizationType = .none
        filed.autocorrectionType = .no
        filed.returnKeyType = .continue
        filed.layer.cornerRadius = 12
        filed.layer.borderColor = UIColor.lightGray.cgColor
        filed.layer.borderWidth = 1
        filed.placeholder = "Email Address...."
        filed.leftView = UIView(frame: CGRect(x:0,y:0,width:5, height:0))
        filed.leftViewMode = .always
        filed.backgroundColor = .white
        return filed
    }()
    private let emailField : UITextField  =  {
        print(#function)
        let filed = UITextField()
        filed.autocapitalizationType = .none
        filed.autocorrectionType = .no
        filed.returnKeyType = .continue
        filed.layer.cornerRadius = 12
        filed.layer.borderColor = UIColor.lightGray.cgColor
        filed.layer.borderWidth = 1
        filed.placeholder = "Email Address...."
        filed.leftView = UIView(frame: CGRect(x:0,y:0,width:5, height:0))
        filed.leftViewMode = .always
        filed.backgroundColor = .white
        return filed
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
    
    private let registerButton : UIButton = {
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
      
      registerButton.addTarget(self, action: #selector(registerButtonTapped),
                            for: .touchUpInside)
      emailField.delegate = self
      pwdField.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
       scrollView.addSubview(pwdField)
        scrollView.addSubview(registerButton)
      imageView.isUserInteractionEnabled = true
      scrollView.isUserInteractionEnabled = true
      
      let gesture = UITapGestureRecognizer (target: self, action: #selector(didChangeProfilePic))
      imageView.addGestureRecognizer(gesture)
    

    }
    
    @objc func didChangeProfilePic() {
        print("Change Pic added")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        
        imageView.frame = CGRect(x:(scrollView.width/2),
                                 y:40,
                                 width:size,
                                height: size)
        
        firstNameField.frame = CGRect(x:30,
                                  y:imageView.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        lastNameField.frame = CGRect(x:30,
                                  y:firstNameField.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        emailField.frame = CGRect(x:30,
                                  y:lastNameField.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        
        pwdField.frame = CGRect(x:30,
                                  y:emailField.bottom + 10,
                                  width:scrollView.width - 60,
                                height: 50)
        registerButton.frame = CGRect(x:30,
                                  y:pwdField.bottom + 20,
                                  width:scrollView.width - 60,
                                height: 50)
        
        
        
    }
    
    @objc private func registerButtonTapped() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        pwdField.resignFirstResponder()
        
        guard let firstName = firstNameField.text ,
              let lastName = lastNameField.text ,
              let email = emailField.text ,
              let password = pwdField.text ,
              !firstName.isEmpty ,
              !lastName.isEmpty ,
              !email.isEmpty,
                !password.isEmpty ,
              password.count >= 6 else {
                alertUserLoginError()
            return
        }
        
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: true)
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
extension RegisterViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            pwdField.becomeFirstResponder()
        }
        else  if textField == pwdField {
            registerButtonTapped()
        }
        
     
        return true
    }
    
}
