//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            Text("Tu będzie ui szukania")
            .navigationBarTitle(Text("Szukaj"))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
