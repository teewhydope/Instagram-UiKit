//
//  RegistrationRepositoryImpl.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

final class RegistrationRepositoryImpl {
    
    private let registrationRemoteDataSource: RegistrationRemoteDataSource
    private let registrationRequestDomainToDataMapper: RegistrationRequestDomainToDataMapper
    
    init() {
        self.registrationRemoteDataSource = RegistrationRemoteDataSource(service: RegistrationService(), registrationRequestDataToApiMapper: RegistrationRequestDataToApiMapper())
        self.registrationRequestDomainToDataMapper = RegistrationRequestDomainToDataMapper()
    }
}

extension RegistrationRepositoryImpl: RegistrationRepository{
    func registerUser(request: RegistrationRequestDomainModel, completion: @escaping (Bool, Error?) -> Void) {
        let request = registrationRequestDomainToDataMapper.map(model: request)
        registrationRemoteDataSource.registration(request: request, completion: completion)
    }
    
}
