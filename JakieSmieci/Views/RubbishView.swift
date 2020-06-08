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
                SearchBar(searchText: $searchText)
                List{

                    ForEach(rubbishData.filter {
                        $0.contains(search: self.searchText)
                    }, id: \.self) { rubbish in
                        RubbishRow(rubbish: rubbish)
                    }
                }
                .resignKeyboardOnDragGesture()
                .navigationBarTitle(Text("Odpady"))
                .navigationBarItems(trailing:
                    Button("Help") {
                        print("Help tapped!")
                    }
                )
            }
        }
    }
}

struct RubbishView_Previews: PreviewProvider {
    static var previews: some View {
        RubbishView()
    }
}
