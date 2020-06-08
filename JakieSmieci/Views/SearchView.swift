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
    @State var showingDetail = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    SearchBar(searchText: $searchText)
                        .background(Color(.white))
                    Rectangle()
                    .frame(height: 1)
                        .foregroundColor(Color(.systemGray4))
                    .padding(.bottom, 0)
                }
                .background(Color(.white))
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
                    }
                } else {
                    ScrollView {
                        CardView(factId: 0)
                        CardView(factId: 1)
                        CardView(factId: 2)
                    }
                        .background(Color(.systemGray6))
                }
                
            }
            
                
            .navigationBarTitle(Text("Gdzie te śmieci"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingDetail.toggle()
                }) {
                    HStack {
                        Image(systemName: "clock.fill")
                            .imageScale(.large)
                        Text("Historia")
                    }
                }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
        
        .accentColor(.green)
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            SearchView()
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            SearchView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
