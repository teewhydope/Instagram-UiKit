//
//  UseCase.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation
import Combine

protocol UseCase {
    
}


protocol BaseUseCase{
    func start() -> Future<Any,Error>
}
