//
//  Exception.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import Foundation

struct Exception: Encodable, Error {

    let message: String
    
    init(message: String) {
        self.message = message
    }
    
}
