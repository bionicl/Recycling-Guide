//
//  HistoryView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        NavigationView {
            List {
                HistoryRow()
                HistoryRow()
                HistoryRow()
            }
            .navigationBarTitle(Text("Historia"))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
