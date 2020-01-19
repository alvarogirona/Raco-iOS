//
//  SubjectAlert.swift
//  RacoDomain
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation


struct SubjectAlert: Codable {
    let id: Int
    let title: String
    let subjectCode: String
    let text: String
    let insertionDate: String
    let updatedDate: String
    let expirationDate: String

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

struct SubjectAttachments: Codable {

}
