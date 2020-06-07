//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @State var showingDetail = false
    
    var body: some View {
            NavigationView {
                VStack {
                    MainSearchBar(text: $text)
                    .contextMenu {
                        Button("Love it: 💕") {
                            self.showingDetail.toggle()
                        }
                        Button("Thoughtful: 🙏") {}
                        Button("Wow!: 🌟") {}
                    }
                    
                    Button(action: {
                        self.showingDetail.toggle()
                    }) {
                    RandomFact(factId: Int.random(in: 1..<rubbishData.count))
                        .padding()
                    }
                        Spacer()
                    .navigationBarTitle(Text("Szukaj"))
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            HStack {
                                Text("Historia")
                                Image(systemName: "clock.fill")
                                    .imageScale(.large)
                            }
                        }
                    )
                    .sheet(isPresented: $showingDetail) {
                        HistoryView()
                    }
                }
                
            }
        .accentColor(.green)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""))
    }
}
