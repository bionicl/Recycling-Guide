//
//  RubbishType.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import Foundation
import UIKit

public struct RubbishItem: Hashable, Codable {
    var _id: Int
    var Identyfikator: Int
    var Nazwa: String
    var Synonim: String
    var Typ: String

    enum TrashType: String, CaseIterable, Codable, Hashable {
        case zmieszane = "Zmieszane"
        case plastikIMetal = "Plastik i metal"
        case inne = "Inne"
        case bio = "Biodegradowalne"
        case szklo = "Szkło"
    }

}
