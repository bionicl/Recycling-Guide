//
//  RandomFact.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 05/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI



struct RandomFact: View {
    var factId: Int = Int.random(in: 1..<rubbishData.count)
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Text(rubbishData[factId].Nazwa)
                    .font(.none)
                    .bold()
                HStack(alignment: .center) {
                    Image(systemName: "trash.fill")
                    .imageScale(.medium)
                    Text(returnRubbishType())
                    .padding(.top,4)
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(rubbishTypeColors[returnRubbishId()])
            .cornerRadius(20)
            .padding()
            Spacer()
        }
    }
    
    func returnRubbishType() -> String {
       switch rubbishData[factId].Typ {
            case "Zmieszane":
                return "Zmieszane"

            case "Szkło":
                return "Szkło"

            case "Bio":
                return "Biodegradowalne"
        
            case "Plastik i metal":
                return "Plastik i metal"
        
            case "Papier":
                return "Papier"
        
            case "Gabaryty":
                return "Wielkogabarytowe"
        
            case "Elektrośmieci":
                return "Wielkogabarytowe"

           default:
               return "none: " + rubbishData[factId].Typ
        }
    }
    
    func returnRubbishId() -> Int {
       switch rubbishData[factId].Typ {
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

           default:
               return 7
        }
    }
    
    let rubbishTypeColors = [Color(.black), Color(.systemGreen), Color(.brown), Color(.systemOrange), Color(.systemBlue), Color(.systemGray), Color(.systemGray), Color(.systemBlue), Color(.systemBlue)]
}

struct RandomFact_Previews: PreviewProvider {
    static var previews: some View {
        RandomFact(factId: Int.random(in: 1..<rubbishData.count))
    }
}
