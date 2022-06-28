//
//  RegistrationRepository.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

protocol RegistrationRepository {
    
    func registerUser(request: RegistrationRequestDomainModel, completion: @escaping (Bool, Error?) -> Void)
}
