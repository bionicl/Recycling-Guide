//
//  RandomFact.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 05/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI



struct CardViewScan: View {
    @Environment(\.colorScheme) var colorScheme
    var headerText : String
    var bodyText : String
    var iconStr : String
    var bgColor = Color(.systemGreen)
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(headerText)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(0)
                HStack {
                    VStack(alignment: .leading) {
                        Text(bodyText)
                        .font(.subheadline)
                            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                            .padding(.top, 8)
                    }
                    Spacer()

                }
                
            }
            
            
            Spacer()
            Circle()
            .frame(width: 50, height: 50)
                .foregroundColor(Color(.systemGray6))
            .overlay(
                Image(systemName: iconStr)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    
                    .foregroundColor(bgColor)
            )
            .frame(height: 80)
        }
        .padding()
        .background(bgColor)
        
        
        
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

struct CardViewScan_Previews: PreviewProvider {
    static var previews: some View {
        CardViewScan(headerText: "Otwórz skaner", bodyText: "Skanuj produkty i wrzuć je do odpowiedniego kontenera!", iconStr: "qrcode.viewfinder", bgColor: Color(.systemGreen))
    }
}
