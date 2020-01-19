//
//  Subject.swift
//  RacoDomain
//
//  Created by alvaro on 12/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

public struct Subject : Codable {
    var id: String
    var url: String
    var guide: String
    var group: String
    var acronym: String
    var upcCode: Int
    var semester: String
    var credits: Double
    var name: String

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
