//
//  ContentView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/16.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplash = true
    @State private var isIntroSeen = false

    var body: some View {
        if isSplash {
            LaunchScreenView(isSplash: self.$isSplash)
        } else {
            if isIntroSeen {
                MapView().environmentObject(ChapterProgress())
            } else {
                IntroView(isIntroSeen: self.$isIntroSeen)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
