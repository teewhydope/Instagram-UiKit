//
//  RegistrationRequestDataToApiMapper.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

public class RegistrationRequestDataToApiMapper {
    public init() {}

    public func map(model: RegistrationRequestDataModel) -> RegistrationRequestApiModel {
        .init(
            email: model.email,
            password: model.password,
            fullname: model.fullname,
            username: model.username,
            profileImage: model.profileImage
        )
    }
}

