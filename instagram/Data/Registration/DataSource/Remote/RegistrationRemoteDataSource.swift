//
//  RegistrationRemoteDataSource.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

final class RegistrationRemoteDataSource {
    
    private let registrationService: RegistrationService
    private let registrationRequestDataToApiMapper: RegistrationRequestDataToApiMapper
    
    public init(
        service: RegistrationService,
        registrationRequestDataToApiMapper: RegistrationRequestDataToApiMapper
    ) {
        self.registrationService = service
        self.registrationRequestDataToApiMapper = registrationRequestDataToApiMapper
    }
}


extension RegistrationRemoteDataSource : RegistrationRemoteSource {
    
    func registration(request: RegistrationRequestDataModel, completion: @escaping (Bool, Error?) -> Void) {
        
        let registrationRequestApiModel = self.registrationRequestDataToApiMapper.map(model: request)
        
        registrationService.registerUser(
            withCredential: registrationRequestApiModel,
            completion: completion
        )
    }
}
