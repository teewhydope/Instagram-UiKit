//
//  UIView.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 28/06/2022.
//

import Foundation
import UIKit


extension UIView {
    func showLoader() {
        let blurLoader = BlurLoader(frame: frame)
        blurLoader.alpha = 0
        self.addSubview(blurLoader)
        
        UIView.animate(withDuration: 0.25) { () -> Void in
            blurLoader.alpha = 1.0
        }
    }
    
    func hideLoader() {
        
        for subView in subviews {
            if(subView is BlurLoader) {
                UIView.animate(withDuration: 0.25) { () -> Void in
                    subView.alpha = 0.0
                }
                if(self.layer.animationKeys()?.count == 0) {
                    subView.removeFromSuperview()
                }
            }
        }
        
    }
}
