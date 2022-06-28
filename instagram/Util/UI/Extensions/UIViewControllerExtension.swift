//
//  UIViewControllerExtension.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 28/06/2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String, message: String, completion:  @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: title, message:
                                                    message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK".localizedLowercase, style: .default, handler: completion))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
