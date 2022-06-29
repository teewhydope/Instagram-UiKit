//
//  RegistrationUiModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 29/06/2022.
//

import Foundation
import UIKit

public struct RegistrationRequestUiModel {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: Data
    
    public init(
        email: String,
        password: String,
        fullname: String,
        username: String,
        profileImage: Data
    ) {
        self.email = email
        self.password = password
        self.fullname = fullname
        self.username = username
        self.profileImage = profileImage
     }
}

