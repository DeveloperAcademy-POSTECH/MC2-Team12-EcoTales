//
//  PandaGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/16.
//

import SwiftUI

struct PandaGameView: View {
    @State private var showGameClear = false
    @State private var isGameFinished = false
    var body: some View {
        ZStack {
            Image("chapterFour-gameBackground")
                .resizable()
                .ignoresSafeArea()

            Group {
                Button(action: {
                    showGameClear.toggle()
                    isGameFinished.toggle()
                }) {
                    Image("character_meenuDoctor")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .position(x: 520, y: 110)
            }

            if showGameClear {
                Image("chapterFour_gameClear")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct PandaGameView_Previews: PreviewProvider {
    static var previews: some View {
        PandaGameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
