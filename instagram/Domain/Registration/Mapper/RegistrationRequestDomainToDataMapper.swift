//
//  RegistrationRequestDomainToDataMapper.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 27/06/2022.
//

import Foundation

public class RegistrationRequestDomainToDataMapper {
    public init() {}

    public func map(model: RegistrationRequestDomainModel) -> RegistrationRequestDataModel {
        .init(
            email: model.email,
            password: model.password,
            fullname: model.fullname,
            username: model.username,
            profileImage: model.profileImage
        )
    }
}

