//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        Image("map_background_Lia")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
