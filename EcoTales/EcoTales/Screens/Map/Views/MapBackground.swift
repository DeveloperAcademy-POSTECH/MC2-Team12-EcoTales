//
//  MapBackground.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/11.
//

import SwiftUI

struct MapBackground: View {
    var body: some View {
        ZStack {
            Image("map_background")
                .resizable()
                .ignoresSafeArea()
        }

    }
}

struct MapBackground_Previews: PreviewProvider {
    static var previews: some View {
        MapBackground()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
