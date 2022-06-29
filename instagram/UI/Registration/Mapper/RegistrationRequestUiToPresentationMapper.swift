//
//  RegistrationRequestUiToPresentationMapper.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 29/06/2022.
//

import Foundation

public class RegistrationRequestUiToPresentationMapper {
    public init() {}
    
    public func map(model: RegistrationRequestUiModel) -> RegistrationRequestPresentationModel {
        .init(
            email: model.email,
            password: model.password,
            fullname: model.fullname,
            username: model.username,
            profileImage: model.profileImage
        )
    }
}
