//
//  LoginController.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import UIKit

class LoginController: BaseViewController<LoginViewModel> {
    
    // MARK: - Properties
    
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeHolder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let loginButton: AuthenticationButton = {
        let button = AuthenticationButton(title: "Login")
        button.isEnabled = false
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot your password?", secondPart: "Get help signing in.")
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Forgot your password?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(showSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        configureUI()
        self.viewModel = LoginViewModel()
        configureNotificationObservers()
        
        super.viewDidLoad()
    }
    
    // MARK: - Helpers
    func configureUI(){
        configureGradientLayer()
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        //iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.centerX(inView: view)
        stackView.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
   
    // MARK: - Actions

  @objc  func showSignUp(){
      let controller = RegistrationController()
      navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc  func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel?.isEmailValidated = sender.text!.validateEmail()
        }
        else {
            viewModel?.isPasswordValidated = sender.text!.validatePassword()
        }
        
        
        if (viewModel!.formIsValid) {
            loginButton.updateLoginButton(isEnabled: true, backgroundColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), titleColor: .white)
        }
        else{
            loginButton.updateLoginButton(isEnabled: false, backgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5), titleColor: UIColor(white: 1, alpha: 0.67))
        }
      }
   
}

extension AuthenticationButton {
    func updateLoginButton(isEnabled: Bool, backgroundColor: UIColor, titleColor: UIColor){
        self.isEnabled = isEnabled
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
    }
}
