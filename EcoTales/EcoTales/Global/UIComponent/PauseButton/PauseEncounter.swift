//
//  PauseEncounter.swift
//  EcoTales

//
//  Created by Seik Oh on 2022/06/09.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopUp = false
    var body: some View {
        ZStack{
            Button(action: {
                self.showPopUp = true
            }, label: {})
            .buttonStyle(PauseButton())
            
            if $showPopUp.wrappedValue {
                Popup()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
