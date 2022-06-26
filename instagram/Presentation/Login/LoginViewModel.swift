//
//  LoginViewModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation

class LoginViewModel: BaseViewModel {
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    
    var formIsValid: Bool {
        return isEmailValidated && isPasswordValidated
    }
    
    public init() {
        let doNothingUseCase = DoNothingUseCase()
        
        super.init(useCase: doNothingUseCase)
       }
}
