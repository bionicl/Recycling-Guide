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
    
    @Environment(\.managedObjectContext) var moc
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
                            ForEach(rubbishData.sorted().filter {
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
                .environment(\.managedObjectContext, self.moc)
            }
            
        }
    }
}

struct ScannerModalView: View {
    @Environment(\.managedObjectContext) var moc
    
    @Binding public var isShowingScanner : Bool
    @FetchRequest(
        entity: Barcode.entity(),
        sortDescriptors: []
    )
    var barcodes:FetchedResults<Barcode>
    
    @State var newItemPushActive = false
    @State var detailsPushActive = false
    
    @State var scannedBarcode = ""
    @State var foundRubbishId = 0
    
    var onDismiss: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            CodeScannerView(codeTypes:[.upce, .ean13, .ean8], simulatedData: "5900717314634", completion: self.handleScan)
                .background(Color(.gray))
                .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 1, green: 1, blue: 1, opacity: 0.3), lineWidth: 5)
                        .frame(width: 260, height: 160)
                    .padding(.top, 100)
                    Text("zeskanuj kod kreskowy")
                        .padding(.top, 100)
                        .font(.headline)
                }
            )
                .padding(.bottom, 0)
            .navigationBarTitle(Text("Skanuj"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.isShowingScanner = false
            }) {
                Text("Gotowe").bold()
            })
            NavigationLink(destination: AllRubbishView(barCode: self.scannedBarcode).environment(\.managedObjectContext, self.moc), isActive: self.$newItemPushActive) {
              Text("")
            }.hidden()
            NavigationLink(destination: DetailedView(rubbish: rubbishData[self.foundRubbishId]).environment(\.managedObjectContext, self.moc), isActive: self.$detailsPushActive) {
              Text("")
            }.hidden()
        }
        
        
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        
        switch result {
        case .success(let code):
            let split = code.components(separatedBy: "\n")
            scannedBarcode = split[0]
            
            var found = false;
            
            for item in barcodes {
                print(item)
                if (item.code == scannedBarcode) {
                    print("Found!" + item.code! + "  " + String(item.rubbishId))
                    found = true
                    foundRubbishId = Int(item.rubbishId)
                    self.detailsPushActive = true
                    break
                }
            }
            if (found == false) {
                self.newItemPushActive = true
            }
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
            ScannerModalView(isShowingScanner: .constant(true), onDismiss: {})
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            RecycleView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .environment(\.colorScheme, .dark)
        }
            
    }
}
