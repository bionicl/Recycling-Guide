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
    fileprivate var Synonim: String
    var Typ: String

    var names: [String] {
        get {
            let arr = Synonim.split(separator: ",")
            var output = [String]()
            output.append(Nazwa.lowercased())
            for item in arr {
                output.append(item.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
            }
            return output
        }
    }
    
    enum TrashType: String, CaseIterable, Codable, Hashable {
        case zmieszane = "Zmieszane"
        case plastikIMetal = "Plastik i metal"
        case inne = "Inne"
        case bio = "Biodegradowalne"
        case szklo = "Szkło"
    }
    
    func contains(search : String) -> Bool {
        for item in names {
            if (item.lowercased().hasPrefix(search.lowercased())) {
                return true
            }
        }
        return false
    }

}
