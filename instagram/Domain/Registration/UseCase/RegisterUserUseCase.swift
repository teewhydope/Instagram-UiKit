//
//  RegisterUserUseCase.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation
import Combine

class RegisterUserUseCase: BaseUseCase {
    
    let repository: RegistrationRepository
    var requestModel: RegistrationRequestDomainModel

    init(repository: RegistrationRepository,
         requestModel: RegistrationRequestDomainModel
    ) {
        self.repository = repository
        self.requestModel = requestModel

    }
    
    func start() -> Future<Any,Error> {
        Future { [weak self] promise in
            guard let requestModel = self?.requestModel else { return }
            
            self?.repository.registerUser(request: requestModel) { result, error in
                
                if result == true {
                    promise(Result.success(result as Bool))
                }
                else {
                    promise(Result.failure(error!))
                }
            }
        }
    }
}
