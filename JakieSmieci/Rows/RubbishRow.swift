//
//  RubbishRow.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct RubbishRow: View {
    var rubbish : RubbishItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(rubbish.Nazwa)
                Text(rubbish.Typ)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct RubbishRow_Previews: PreviewProvider {
    static var previews: some View {
        RubbishRow(rubbish: rubbishData[0])
        .padding()
    }
}
