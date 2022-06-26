//
//  PasswordValidation.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation

extension String {
     func validatePassword()-> Bool {
     let result = self.range(
            of: Constants.passwordPattern,
            options: .regularExpression
        )
        
        return result != nil
    }
}
