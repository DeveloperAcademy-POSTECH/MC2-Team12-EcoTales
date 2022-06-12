//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
    var body: some View {
        ZStack {
            Image("chapterOne_pollutedBackground")
                .resizable()
                .ignoresSafeArea()
            LocatingHiddenObjView()
            VStack {
                Image("game_woodenPanel")
                Spacer()
                ObjectsToFind()
            }
        }
    }
}

struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
