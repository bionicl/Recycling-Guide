//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    @State var showingDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green // <----
                .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Masz wątpliwości?")
                        .font(.title)
                        .bold()
                    Text("Wpisz w wyszukiwarce odpady, które wzbudzają Twoje wątpliwości i dowiedz się gdzie należy je wyrzucić.")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    MainSearchBar(text: $searchText)
                        .padding(.horizontal)
                    Text("lub")
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        
                    Button(action: {
                        print("Delete tapped!")
                    }) {
                        HStack {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.body)
                                .foregroundColor(.green)
                            Text("Sprawdź zasady segregacji")
                                .font(.body)
                            .foregroundColor(.green)
                        }
                        .padding(12)
                        .foregroundColor(.white)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        }
                    .padding(.bottom, 100)
                        
                        
                        
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
                    .sheet(isPresented: $showingDetail) {
                        HistoryView(showSheetView: self.$showingDetail)
                    }
                        
                    
                }
                .accentColor(.green)
            }
            
        }
        .accentColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            SearchView(searchText: .constant(""))
                .previewDevice(PreviewDevice(rawValue: "iPhone X"))
            SearchView(searchText: .constant(""))
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        }
    }
}
