//
//  BaseViewModel.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation
import UIKit


protocol BaseViewModelProtocol {
    associatedtype U
}

class BaseViewModel: BaseViewModelProtocol{
    typealias U = UseCase
    
    var useCase: U?
    var showError: Bool = false
    var isLoading: Bool = false

    init(useCase: U) {
        self.useCase = useCase
    }
}
