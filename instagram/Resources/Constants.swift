//
//  StringConstants.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation


struct Constants {

    static let emailPattern = #"^\S+@\S+\.\S+$"#
    
    static let passwordPattern =
        // At least 8 characters
        #"(?=.{8,})"# +

        // At least one capital letter
        #"(?=.*[A-Z])"# +
            
        // At least one lowercase letter
        #"(?=.*[a-z])"# +
            
        // At least one digit
        #"(?=.*\d)"# +
            
        // At least one special character
        #"(?=.*[ !$%#&?._-])"#
    
}

