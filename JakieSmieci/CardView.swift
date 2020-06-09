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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(rubbishData[factId].Nazwa)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .padding(0)
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "arrow.down.circle.fill")
                                .imageScale(.small)
                                .padding(.vertical, 0)
                            Text("wyrzuć do")
                                .font(.caption)
                        }
                        .foregroundColor(.gray)
                        Text("Pojemnika na " + RubbishDisplay.returnRubbishType(rubbish: rubbishData[factId]))
                        .font(.subheadline)
                            .foregroundColor(.primary)
                    }
                    Spacer()

                }
                
            }
            
            
            Spacer()
            Circle()
            .frame(width: 50, height: 50)
                .foregroundColor(RubbishDisplay.returnRubbishColor(rubbish: rubbishData[factId]))
            .overlay(
                Image(rubbishData[factId].Typ)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    
                    .foregroundColor(.white)
            )
        }
        .padding()
        .background(colorScheme == .dark ? Color(.systemGray6) : Color(.systemBackground))
        
        
        
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
}

struct RandomFact_Previews: PreviewProvider {
    static var previews: some View {
        CardView(factId: Int.random(in: 1..<rubbishData.count))
    }
}
