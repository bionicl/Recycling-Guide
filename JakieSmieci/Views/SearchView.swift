//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var showCancelButton = false
    @State var showingDetail = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    SearchBar(searchText: $searchText, showCancelButton: $showCancelButton)
                        .background(Color(.systemBackground))
                    Rectangle()
                    .frame(height: 1)
                        .foregroundColor(Color(.systemGray4))
                    .padding(.bottom, 0)
                }
                .background(Color(.systemBackground))
                if (self.searchText.count > 0) {
                    VStack {
                        // Filtered list of nam
                        List {
                            ForEach(rubbishData.filter {
                                $0.contains(search: self.searchText)
                            }, id: \.self) { rubbish in
                                RubbishRow(rubbish: rubbish)
                            }
                        }
                        .id(UUID())
                        .resignKeyboardOnDragGesture()
                    }
                } else if (self.showCancelButton) {
                    HistoryView(showSheetView: .constant(false))
                } else {
                    ScrollView() {
                        Spacer()
                        Spacer()
                        CardView(factId: 30)
                        CardView(factId: 12)
                        CardView(factId: 252)
                    }
                        .background(Color(.systemGray6))
                }
                
            }

            .navigationBarTitle(Text("Gdzie te śmieci"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    Image(systemName: "info.circle.fill")
                    .imageScale(.large)
                }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
            
        
        .accentColor(.green)
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
        .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            //.environment(\.colorScheme, .dark)
    }
}
