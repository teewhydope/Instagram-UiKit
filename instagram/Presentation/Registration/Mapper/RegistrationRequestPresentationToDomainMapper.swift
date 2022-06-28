//
//  RegistrationRequestPresentationToDomainMapper.swift
//  instagram
//
//  Created by Animasahun Ibrahim on 28/06/2022.
//

import Foundation

public class RegistrationRequestPresentationToDomainMapper {
    public init() {}

    public func map(model: RegistrationRequestPresentationModel) -> RegistrationRequestDomainModel {
        .init(
            email: model.email,
            password: model.password,
            fullname: model.fullname,
            username: model.username,
            profileImage: model.profileImage
        )
    }
}
