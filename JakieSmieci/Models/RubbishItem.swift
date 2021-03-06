//
//  RubbishType.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import Foundation
import UIKit

struct RubbishItem: Hashable, Codable, Comparable {
    static func < (lhs: RubbishItem, rhs: RubbishItem) -> Bool {
        return lhs.Nazwa < rhs.Nazwa
    }
    
    var _id: Int
    var Identyfikator: Int
    var Nazwa: String
    fileprivate var Synonim: String
    var Typ: String
    
    var names: [String] {
        returnNames(synonim: Synonim)
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

    func returnNames(synonim : String) -> [String] {
        let arr = self.Synonim.split(separator: ",")
        var output = [String]()
        output.append(self.Nazwa.lowercased())
        for item in arr {
            output.append(item.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
        }
        return output
    }
}
