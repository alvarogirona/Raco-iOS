//
//  Subject.swift
//  RacoDomain
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public struct RemoteSubject : Codable {
    public let id: String
    public let url: String?
    public let guide: String?
    public let group: String?
    public let acronym: String?
    public let upcCode: Int?
    public let semester: String?
    public let credits: Double?
    public let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case guide = "guia"
        case group = "grup"
        case acronym = "sigles"
        case upcCode = "codi_upc"
        case semester = "semestre"
        case credits = "credits"
        case name = "nom"
    }
}
