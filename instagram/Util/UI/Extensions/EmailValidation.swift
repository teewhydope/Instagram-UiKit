//
//  EmailValidation.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation

extension String {
     func validateEmail()-> Bool {
     let result = self.range(
            of: Constants.emailPattern,
            options: .regularExpression
        )
        
        return result != nil
    }
}
