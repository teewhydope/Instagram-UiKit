//
//  RegistrationViewModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation
import Combine

public class RegistrationViewModel : BaseViewModel {
    var isEmailValidated = false
    var isPasswordValidated = false
    var isFullnameValidated = false
    var isUsernameValidated = false
    public var requestModel: RegistrationRequestPresentationModel?
    private let registrationRequestPresentationToDomainMapper: RegistrationRequestPresentationToDomainMapper
    
    var formIsValid: Bool {
        return isEmailValidated && isPasswordValidated && isFullnameValidated && isUsernameValidated
    }
    
    
    init(){
        self.registrationRequestPresentationToDomainMapper = RegistrationRequestPresentationToDomainMapper()
        super.init(useCase: nil)
    }
    
    func registerUser() -> Future<Any, Error>? {
        let repository = RegistrationRepositoryImpl(remoteDataSource: RegistrationRemoteDataSource(service: RegistrationService(), registrationRequestDataToApiMapper: RegistrationRequestDataToApiMapper()), registrationRequestDomainToDataMapper: RegistrationRequestDomainToDataMapper())
        
        let registerUserUseCase = RegisterUserUseCase(repository: repository, requestModel: registrationRequestPresentationToDomainMapper.map(model: requestModel!))
        
        let request = registrationRequestPresentationToDomainMapper.map(model: requestModel!)
        
        self.isLoading = true
        self.showError = false
        
        registerUserUseCase.requestModel = request
        return registerUserUseCase.start()
    }
}
