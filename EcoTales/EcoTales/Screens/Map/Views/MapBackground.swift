//
//  MapBackground.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct MapBackground: View {
    @State private var isStagePopup = false
    var body: some View {
        ZStack {
            Image("map_background")
<<<<<<< HEAD
                .backgroundImage()
=======
                .resizable()
                .ignoresSafeArea()
            Button(action: {
                self.isStagePopup = true
            }, label: {})
            .buttonStyle(PauseButtonStyle())
            if isStagePopup {
                MapPopup(isStagePopup: $isStagePopup)
            }
>>>>>>> main
        }
    }
}

struct MapBackground_Previews: PreviewProvider {
    static var previews: some View {
        MapBackground()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
