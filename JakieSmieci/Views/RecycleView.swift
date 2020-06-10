//
//  SearchView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 03/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI
import Combine

struct RecycleView: View {
    @State private var searchText = ""
    @State private var showCancelButton = false
    @State var showingDetail = false
    
    @State private var isShowingScanner = false
    
    @Environment(\.colorScheme) var colorScheme
    
    let featuredIds = [50, 120, 210, 530, 393]
    
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
                    HistoryView()
                } else {
                    ScrollView() {
                        Spacer()
                        Spacer()
                        
                        ForEach(featuredIds, id: \.self) { item in
                            NavigationLink(destination: DetailedView(rubbish: rubbishData[item])) {
                                CardView(factId: item)
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                        
                    .background(colorScheme == .dark ? Color.black : Color(.systemGray6))
                }
                
            }

            .navigationBarTitle(Text("Segreguj"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.isShowingScanner.toggle()
                }) {
                    Image(systemName: "qrcode.viewfinder")
                    .imageScale(.large)
                        .foregroundColor(Color(.systemGreen))
                }
            )
            .edgesIgnoringSafeArea(.bottom)
        }
        .accentColor( .white)
        
        .sheet(isPresented: $isShowingScanner) {
            NavigationView {
                ScannerModalView(isShowingScanner: self.$isShowingScanner, onDismiss: {
                    self.isShowingScanner = false
                })
            }
        }
    }
}

struct ScannerModalView: View {
    @Binding public var isShowingScanner : Bool
    
    @State var pushActive = false
    
    var onDismiss: () -> Void

    var body: some View {
        VStack {
            CodeScannerView(codeTypes:[.upce, .ean13, .ean8], simulatedData: "5900717314634", completion: self.handleScan)
            .navigationBarTitle(Text("Skanuj"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.isShowingScanner = false
            }) {
                Text("Gotowe").bold()
            })
            NavigationLink(destination: DetailedView(rubbish: rubbishData[0]), isActive: self.$pushActive) {
              Text("")
            }.hidden()
        }
        
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        
        switch result {
        case .success(let code):
            print(code.components(separatedBy: "\n"))
            pushActive = true
        case .failure(_):
            print("Error")
            self.isShowingScanner = false
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecycleView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            RecycleView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .environment(\.colorScheme, .dark)
        }
            
    }
}
