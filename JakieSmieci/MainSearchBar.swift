//
//  MainSearchBar.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 05/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct MainSearchBar: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Gdzie wyrzucić...", text: $text)
                .padding(8)
                .padding(.horizontal, 8)
                .background(Color(.systemGray6))
                    .cornerRadius(8)
        }
        
        
    }
}

struct MainSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchBar(text: .constant(""))
    }
}
