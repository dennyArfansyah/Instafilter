//
//  ConfirmationDialog.swift
//  Instafilter
//
//  Created by Denny Arfansyah on 29/01/23.
//

import SwiftUI

struct ConfirmationDialogView: View {
    @State private var showingConfirmation = false
    @State private var background = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(background)
            .onTapGesture {
                showingConfirmation.toggle()
            }
            .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
                Button("Red") {
                    background = .red
                }
                Button("Blue") {
                    background = .blue
                }
//                Button("Cancel") {}
            } message: {
                Text("Do you want to change background?")
            }
    }
}

struct ConfirmationDialog_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationDialogView()
    }
}
