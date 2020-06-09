//
//  RubbishRow.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI
import CoreData

struct RubbishRow: View {
    @Environment(\.managedObjectContext) var moc
    var rubbish : RubbishItem
    
    var body: some View {
        NavigationLink(destination: DetailedView(rubbish: rubbish)
            .onAppear {
                
                let newHistoryItem = HistoryItem(context: self.moc)
                newHistoryItem.id = UUID()
                newHistoryItem.rubbishId = Int32(self.rubbish._id - 1)
                newHistoryItem.date = Date()
                
                try? self.moc.save()
            })
        {
            VStack(alignment: .leading) {
                Text(rubbish.Nazwa)
                Text(rubbish.Typ)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        
    }
}

struct RubbishRow_Previews: PreviewProvider {
    static var previews: some View {
        RubbishRow(rubbish: rubbishData[0])
        .padding()
    }
}
