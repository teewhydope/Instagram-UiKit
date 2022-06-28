//
//  RegistrationRemoteDataSource.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

protocol RegistrationRemoteSource{
    func registration(request: RegistrationRequestDataModel, completion: @escaping (Bool, Error?) -> Void)
}
