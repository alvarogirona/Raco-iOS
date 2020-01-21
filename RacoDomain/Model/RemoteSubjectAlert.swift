//
//  SubjectAlert.swift
//  RacoDomain
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation


public struct RemoteSubjectAlert: Codable {
    public let id: Int
    public let title: String
    public let subjectCode: String
    public let text: String
    public let insertionDate: String
    public let updatedDate: String
    public let expirationDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "titol"
        case subjectCode = "codi_assig"
        case text = "text"
        case insertionDate = "data_insercio"
        case updatedDate = "data_modificacio"
        case expirationDate = "data_caducitat"
    }
}

public struct RemoteSubjectAttachment: Codable {

}
