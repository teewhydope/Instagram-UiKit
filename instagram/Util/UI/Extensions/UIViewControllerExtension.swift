//
//  UIViewControllerExtension.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 28/06/2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String, message: String, completion:  @escaping (() -> Void?)) {
        let alertController = UIAlertController(title: title, message:
                                                    message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        alertController.addAction(UIAlertAction(title: "OK".localizedLowercase, style: .default, handler: { (alert) -> Void in
            completion() ?? self.dismiss(animated: true)
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
