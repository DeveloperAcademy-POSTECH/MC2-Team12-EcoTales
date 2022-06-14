//
//  MapBackground.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct MapBackground: View {
    @State private var isMapPopup = false
    var body: some View {
        ZStack {
            Image("map_background")
                .resizable()
                .ignoresSafeArea()
            Button(action: {
                self.isMapPopup = true
            }, label: {})
            .buttonStyle(PauseButtonStyle())
            if isMapPopup {
                MapPopup(isMapPopup: $isMapPopup)
            }
        }
    }
}

struct MapBackground_Previews: PreviewProvider {
    static var previews: some View {
        MapBackground()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
