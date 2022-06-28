//
//  RegistrationDomainModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 28/06/2022.
//

import Foundation

public struct RegistrationDomainModel: Codable {
    var isRegistrationComplete: Bool
    
    public init(
        isRegistrationComplete: Bool
    ) {
        self.isRegistrationComplete = isRegistrationComplete
     }
}
