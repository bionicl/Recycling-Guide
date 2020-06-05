//
//  RubbishView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct RubbishView: View {
    @State private var searchText : String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List{

                    ForEach(rubbishData.filter {
                        self.searchText.isEmpty ? true : $0.Nazwa.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { rubbish in
                        RubbishRow(rubbish: rubbish)
                    }
                }

            
                .navigationBarTitle(Text("Odpady"))
            }
        }
    }
}

struct RubbishView_Previews: PreviewProvider {
    static var previews: some View {
        RubbishView()
    }
}
