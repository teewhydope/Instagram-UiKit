//
//  RegistrationViewModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation
import Combine
import UIKit

public class RegistrationViewModel : BaseViewModel {
    var isEmailValidated = false
    var isPasswordValidated = false
    var isFullnameValidated = false
    var isUsernameValidated = false
    var isProfileImageSelected: UIImage?
    private let registrationRequestPresentationToDomainMapper: RegistrationRequestPresentationToDomainMapper
    
    var formIsValid: Bool {
        return isEmailValidated && isPasswordValidated && isFullnameValidated && isUsernameValidated && isProfileImageSelected != nil
    }
    
    
    init(){
        self.registrationRequestPresentationToDomainMapper = RegistrationRequestPresentationToDomainMapper()
        super.init(useCase: nil)
    }
    
    func registerUser(requestModel: RegistrationRequestPresentationModel) -> Future<Any, Error>? {
        let registerUserUseCase = RegisterUserUseCase(repository: RegistrationRepositoryImpl(), requestModel: registrationRequestPresentationToDomainMapper.map(model: requestModel))
        
        self.isLoading = true
        self.showError = false
        return registerUserUseCase.start()
    }
    
    func validateEmail(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        
        if !text.validateEmail()  {
            return
        }
        
        isEmailValidated = true
    }
    
    func validatePassword(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        
        if !text.validatePassword()  {
            return
        }
        
        isPasswordValidated = true
    }
    
    func validateFullname(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        
        isFullnameValidated = true
    }
    
    func validateUsername(text: String?) {
        guard let text = text, !text.isEmpty else {
            return
        }
        
        isUsernameValidated = true
    }
}
