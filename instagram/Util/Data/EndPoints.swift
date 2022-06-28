//
//  EndPoints.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation


struct EndPoints {
    static let endPointVersion = "/v3"
    
 
    struct CartTypes {
        static let endPointController = "/"
        
        static var manufacturer: String { get {  return "\(endPointVersion)\(endPointController)17448d3b-d6cf-40f0-a580-dc000247f4ab" }  }
        
        static var mainTypes: String { get {  return "\(endPointVersion)\(endPointController)b7915703-4927-4336-8e1a-8a596b2db5f1" }  }
    }
}
