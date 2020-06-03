//
//  RubbishView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct RubbishView: View {
    var body: some View {
        NavigationView {
            List(rubbishData, id: \._id) { rubbish in
                RubbishRow(rubbish: rubbish)
                    
            }

            
            .navigationBarTitle(Text("Odpady"))
        }
    }
}

struct RubbishView_Previews: PreviewProvider {
    static var previews: some View {
        RubbishView()
    }
}
