//
//  RandomFact.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 05/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI



struct CardView: View {
    var factId: Int = Int.random(in: 1..<rubbishData.count)
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text("Folia spożywcza")
                    .font(.)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding(0)
                HStack {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.small)
                        .padding(.vertical, 0)
                    Text("wyrzuć do")
                        .font(.caption)
                }
                .foregroundColor(.gray)
                Text("Pojemnika na metale i tworzywa sztuczne")
                    .font(.subheadline)
            }
            
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .padding(.top)
        .padding(.horizontal)
        .shadow(color: Color(.systemGray5), radius: 5)
        
        
//        HStack {
//            VStack {
//
//                Text(rubbishData[factId].Nazwa)
//                    .bold()
//                    .fixedSize(horizontal: false, vertical: true)
//                    .font(.headline)
//                    .multilineTextAlignment(.center)
//
//
//                Image(systemName: "arrow.down.circle.fill")
//                .imageScale(.medium)
//                    .foregroundColor(Color(.white).opacity(0.5))
//                Text(returnRubbishType())
//                .padding(.top,4)
//                    .font(.subheadline)
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(rubbishTypeColors[returnRubbishId()])
//            .cornerRadius(20)
//            .padding()
//        }
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
        
            case "Zielone":
                return "Zielone"
        
            case "Inne":
                return "Inne"

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
        
            case "Zielone":
                return 7
        
            case "Inne":
                return 8

            default:
                return 9
        }
    }
    
    let rubbishTypeColors = [Color(.black), Color(.systemGreen), Color(.brown), Color(.systemOrange), Color(.systemBlue), Color(.systemGray), Color(.systemGray), Color(.systemGreen), Color(.systemGray), Color(.systemGray)]
}

struct RandomFact_Previews: PreviewProvider {
    static var previews: some View {
        CardView(factId: Int.random(in: 1..<rubbishData.count))
    }
}