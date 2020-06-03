//
//  HistoryRow.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct HistoryRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Paragon")
                Text("Odpady zmieszane")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "trash.fill")
                .imageScale(.large)
                .foregroundColor(.black)
        }
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRow()
            .padding()
    }
}
