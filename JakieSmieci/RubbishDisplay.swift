//
//  RubbishDisplay.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 09/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import Foundation
import SwiftUI

public class RubbishDisplay {
    
    
    static let rubbishTypeColors = [Color(.black), Color(.systemGreen), Color(.brown), Color(.systemOrange), Color(.systemBlue), Color(.systemGray), Color(.systemGray), Color(.systemGreen), Color(.systemGray), Color(.systemGray)]
    
    static func returnRubbishType(rubbish : RubbishItem) -> String {
       switch rubbish.Typ {
            case "Zmieszane":
                return "śmieci zmieszane"

            case "Szkło":
                return "szkło"

            case "Bio":
                return "biodegradowalne"
        
            case "Plastik i metal":
                return "plastik i metal"
        
            case "Papier":
                return "papier"
        
            case "Gabaryty":
                return "wielkogabarytowe"
        
            case "Elektrośmieci":
                return "elektrośmieci"
        
            case "Zielone":
                return "zielone"
        
            case "Inne":
                return "inne"

            default:
                return "none: " + rubbish.Typ
        }
    }
    
    static func returnRubbishId(rubbish : RubbishItem) -> Int {
       switch rubbish.Typ {
            case "Zmieszane":
                return 0

            case "Szkło":
                return 1

            case "Bio":
                return 2
        
            case "Plastik i metal":
                return 3
        
            case "Papier":
                return 4
        
            case "Gabaryty":
                return 5
        
            case "Elektrośmieci":
                return 6
        
            case "Zielone":
                return 7
        
            case "Inne":
                return 8

            default:
                return 9
        }
    }
    
    static func returnRubbishColor(rubbish : RubbishItem) -> Color {
        let id = returnRubbishId(rubbish: rubbish)
        return rubbishTypeColors[id]
    }
}
