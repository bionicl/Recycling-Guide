//
//  HistoryView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: HistoryItem.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \HistoryItem.date, ascending: false)]
    )
    var historyItems:FetchedResults<HistoryItem>
    var maxRange = 100;
    var range: Range<Int> = 0..<100
    
    @State private var newHistoryItem = ""
    
    var body: some View {
        List {
            Section(header: Text("Ostatnie wyszukiwania")) {
                ForEach(historyItems, id: \.id) { item in
                    RubbishRow(rubbish: rubbishData[Int(item.rubbishId)])
                }
            }
        }
        .resignKeyboardOnDragGesture()
            
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
