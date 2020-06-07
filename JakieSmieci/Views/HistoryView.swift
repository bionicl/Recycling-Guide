//
//  HistoryView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
            List {
                HistoryRow()
                HistoryRow()
                HistoryRow()
            }
            .navigationBarTitle(Text("Historia"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.showSheetView = false;
            }) {
                Text("Gotowe").bold()
            })
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showSheetView: .constant(true))
    }
}
