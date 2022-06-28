//
//  RegistrationController.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation
import UIKit
import Combine

class RegistrationController: BaseViewController<RegistrationViewModel> {
    
    // MARK: - Properties
    
    private var profileImage: UIImage?
    var observer: [AnyCancellable] = []
    
    private lazy var plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(selectProfilePhoto), for: .touchUpInside)
        return button
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
    
    private let fullnameTextField = CustomTextField(placeHolder: "Fullname")
    
    private let usernameTextField = CustomTextField(placeHolder: "Username")
    
    private lazy var signUpButton: AuthenticationButton = {
        let button =  AuthenticationButton(title: "Sign Up")
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Already have an account?", secondPart: "Login")
        button.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad(){
        self.viewModel = RegistrationViewModel()
        
        configureUI()
        configureNotificationObservers()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        configureGradientLayer()
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stackView: UIStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.centerX(inView: view)
        stackView.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    func configureNotificationObservers(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
    // MARK: - Actions
    
    @objc  func showLogin(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc  func textDidChange(sender: UITextField){
        
        switch sender {
        case emailTextField: viewModel?.isEmailValidated = sender.text!.validateEmail()
        case passwordTextField: viewModel?.isPasswordValidated = sender.text!.validatePassword()
        case fullnameTextField: viewModel?.isFullnameValidated = sender.text!.isEmpty == false
        case usernameTextField: viewModel?.isUsernameValidated = sender.text!.isEmpty == false
        default: break
            
        }
        
        
        if (viewModel!.formIsValid) {
            signUpButton.updateAuthenticationButton(isEnabled: true, backgroundColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), titleColor: .white)
        }
        else{
            signUpButton.updateAuthenticationButton(isEnabled: false, backgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5), titleColor: UIColor(white: 1, alpha: 0.67))
        }
    }
    
    @objc func selectProfilePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func handleSignUp(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullname = fullnameTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        
        viewModel?.requestModel  = RegistrationRequestPresentationModel(email: email, password: password, fullname: fullname, username: username, profileImage: profileImage.pngData()!
        )
        signUpUser()
    }
    
    func signUpUser() {
        if(viewModel != nil) {
            self.viewModel!.isLoading = true
            if(viewModel!.isLoading) {
                view.showLoader()
            }
            
            self.viewModel!.registerUser()?.receive(on: DispatchQueue.main).sink( receiveCompletion: {[weak self] completion in
                self?.viewModel?.isLoading = false
                self?.view.hideLoader()
                
            }, receiveValue: {[weak self] response in
                let res = response as? Bool
                let controller = MainTabController()
                
                if(response as? Bool ?? true) {
                    self?.showAlert(title: "Success".localizedLowercase, message: "Registration Successful", completion: {[weak self] action in
                        self?.dismiss(animated: true)
                    })                }
                self?.showAlert(title: "Warning".localizedLowercase, message: res?.description.localizedLowercase ?? "An error occured", completion: {[weak self] action in
                    self?.dismiss(animated: true)
                })
            }).store(in: &observer)
        }
        
    }
    
}

// MARK: - UIImageControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage
        let layer = plusPhotoButton.layer
        
        layer.cornerRadius = plusPhotoButton.frame.width / 2
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
