//
//  HistoryView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(
        entity: HistoryItem.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \HistoryItem.date, ascending: false)]
    )
    var historyItems:FetchedResults<HistoryItem>
    
    @State private var newHistoryItem = ""
    
    var body: some View {
        List {
            Section(header: Text("Ostatnie wyszukiwania")) {
                ForEach(historyItems, id: \.id) { item in
                    RubbishRow(rubbish: rubbishData[Int(item.rubbishId)])
                }
            }
        }
            
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
