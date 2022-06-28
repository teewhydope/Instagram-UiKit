//
//  DoNothingUseCase.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation
import Combine


class DoNothingUseCase: BaseUseCase {
    func start() -> Future<Any, Error> {
        Future { [weak self] promise in
            return  promise(Result.success(false))
        }
    }
}
