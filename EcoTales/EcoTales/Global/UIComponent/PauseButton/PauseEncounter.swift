//
//  PauseEncounter.swift
//  EcoTales

//
//  Created by Seik Oh on 2022/06/09.
//

import SwiftUI

struct PauseEncounter: View {
    @State private var showPopUp = false
    var body: some View {
        ZStack{
            Button(action: {
                self.showPopUp = true
            }, label: {})
            .buttonStyle(PauseButton())
            
            if $showPopUp.wrappedValue {
                StoryPopup()
            }
        }
    }
}

struct PauseEncounter_Previews: PreviewProvider {
    static var previews: some View {
        PauseEncounter()
    }
}
