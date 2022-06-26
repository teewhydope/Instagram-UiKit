//
//  CustomButton.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 26/06/2022.
//

import UIKit

class AuthenticationButton: UIButton {
    
     init(title: String) {
         super.init(frame: .zero)
         
         setTitle(title, for: .normal)
         setTitleColor(.white, for: .normal)
         backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
         layer.cornerRadius = 5
         setHeight(50)
         titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
