//
//  AllRubbishView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 10/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct AllRubbishView: View {
    @Environment(\.presentationMode) var presentationMode
    public var barCode : String
    
    @State private var searchText = ""
    @State private var showCancelButton = false
    
    @State private var showingAlert = false
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Text("Nie znaleziono kodu w bazie. Wyszukaj zeskanowany produkt aby był widoczny dla wszystkich użytkowników!")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top)
                SearchBar(searchText: $searchText, showCancelButton: $showCancelButton)
                    .background(Color(.systemBackground))
                Rectangle()
                .frame(height: 1)
                    .foregroundColor(Color(.systemGray4))
                .padding(.bottom, 0)
            }
                .background(Color(.systemBackground))
            VStack {
                // Filtered list of nam
                List {
                    ForEach(rubbishData.sorted().filter {
                        $0.contains(search: self.searchText)
                    }, id: \.self) { rubbish in
                        Button(action: {
                            let newBarcode = Barcode(context: self.moc)
                            newBarcode.id = UUID()
                            newBarcode.rubbishId = Int32(rubbish._id - 1)
                            newBarcode.code = self.barCode
                            
                            print("adding: " + String(Int32(rubbish._id - 1)))
                            try? self.moc.save()
                            print("error")
                            self.showingAlert = true
                        }) {
                            VStack(alignment: .leading) {
                                Text(rubbish.Nazwa)
                                Text(rubbish.Typ)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .id(UUID())
                .resignKeyboardOnDragGesture()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Dodano kod kreskowy"),
                      message: Text("Dziękujemy za tworzenie bazy recyklingu produktów! Możesz teraz zeskanować kolejny produkt."),
                      dismissButton: Alert.Button.default(
                          Text("Ok"),
                          action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                      ))
            }
        }
    }
}

struct AllRubbishView_Previews: PreviewProvider {
    static var previews: some View {
        AllRubbishView(barCode: "1234")
    }
}
