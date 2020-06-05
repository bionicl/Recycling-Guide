//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                MainSearchBar(text: $text)
                RandomFact(factId: Int.random(in: 1..<rubbishData.count))
                    .padding()
                    Spacer()
                .navigationBarTitle(Text("Szukaj"))
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
