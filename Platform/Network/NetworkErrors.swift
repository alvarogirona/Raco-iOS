//
//  NetworkErrors.swift
//  Platform
//
//  Created by alvaro on 19/01/2020.
//  Copyright © 2020 Álvaro Girona. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case responseNotValidData
    case responseFailure
    case parsingError
}
