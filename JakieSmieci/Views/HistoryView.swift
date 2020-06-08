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
        List {
            Section(header: Text("Ostatnie wyszukiwania")) {
                RubbishRow(rubbish: rubbishData[0])
                RubbishRow(rubbish: rubbishData[1])
            }
        }
            
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(showSheetView: .constant(true))
    }
}
