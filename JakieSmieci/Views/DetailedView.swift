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
    
    @State private var showingSheet = false
    
    var body: some View {
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
                Text(rubbish.Nazwa)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                
                Spacer()
            }
                Spacer()
            .navigationBarTitle("Informacje", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingSheet = true
                }) {
                    Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
                }
            )
            .sheet(
                isPresented: $showingSheet,
                content: {
                    ActivityView(activityItems: [NSURL(string: "https://swiftui.gallery")!] as [Any], applicationActivities: nil)
                }
            )
        }
        .padding()
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
