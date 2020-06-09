//
//  DetailedView.swift
//  JakieSmieci
//
//  Created by Maciej Maj on 08/06/2020.
//  Copyright © 2020 Teal Fire. All rights reserved.
//

import SwiftUI

struct DetailedView: View {
    var rubbish : RubbishItem
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showingSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                VStack() {
                    Circle()
                        .frame(width: 140, height: 140)
                        .foregroundColor(RubbishDisplay.returnRubbishColor(rubbish: rubbish))
                        .overlay(
                            Image(rubbish.Typ)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                        )
                        .padding(.top, 60)
                    Text(rubbish.Nazwa)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack {
                        Image(systemName: "arrow.down.circle.fill")
                            .imageScale(.small)
                            .padding(.vertical, 0)
                        Text("wyrzuć do")
                            .font(.caption)
                    }
                    .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 0.7))
                    Text("pojemnika na " + RubbishDisplay.returnRubbishType(rubbish: rubbish))
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                }
                    Spacer()
            }
            .background(RubbishDisplay.returnRubbishColor(rubbish: rubbish))

            
            VStack {
                ScrollView() {
                    Spacer()
                    Spacer()
                    Button(action: {
                        self.showingSheet = true
                    }) {
                        HStack {
                            Text("Udostępnij")
                            Spacer()
                            Image(systemName: "square.and.arrow.up")
                        }
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(colorScheme == .dark ? Color(.systemGray6) : Color(.systemBackground))
                            .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Śmieci zmieszane")
                            .font(.headline)
                            .padding(.bottom)
                        Text("Do pojemnika na odpady zmieszane wrzucaj tylko to, czego nie udało się rozdzielić do pojemników na odpady segregowane lub czego nie można oddać do PSZOK-u lub MPSZOK-u.")
                        Text("Wrzucaj:")
                            .foregroundColor(Color(.systemGreen))
                            .font(.headline)
                            .padding(.vertical)
                        Text("Czyste opakowania z papieru i tektury, gazety, czasopisma i ulotki, kartony, zeszyty, papier biurowy")
                            .lineLimit(nil)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text("Nie wrzucaj:")
                        .foregroundColor(Color(.systemRed))
                        .font(.headline)
                        .padding(.vertical)
                        Text("Sprzęt elektryczny oraz elektroniczny, AGD, baterie i akumulatory, odpady budowlane i remontowe, odpady zielone, leki oraz chemikalia")
                        .lineLimit(nil)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                        .padding()
                        .background(colorScheme == .dark ? Color(.systemGray6) : Color(.systemBackground))
                        .cornerRadius(10)
                    .padding(.horizontal)
                    Spacer()
                    Spacer()
                }
                
            }
            .background(colorScheme == .dark ? Color.black : Color(.systemGray6))
        }
        .edgesIgnoringSafeArea(.top)
            
            
            
        // Navigation
        .navigationBarTitle("", displayMode: .large)
            
        // Share sheet
        .sheet(
            isPresented: $showingSheet,
            content: {
                ActivityView(activityItems: [NSURL(string: "https://swiftui.gallery")!] as [Any], applicationActivities: nil)
            }
        )
    }
    
}

struct ActivityView: UIViewControllerRepresentable {

    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}


struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(rubbish: rubbishData[0])
    }
}
