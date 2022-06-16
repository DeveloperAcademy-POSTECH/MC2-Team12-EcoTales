//
//  PandaGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/16.
//

import SwiftUI

struct PandaGameView: View {
    var body: some View {
        ZStack {
            Image("chapterFour-gameBackground")
                .resizable()
                .ignoresSafeArea()
            Group {
                Button(action: {
                    print("성공!")
                }) {
                    Image("character_meenuDoctor")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                .position(x: 520, y: 110)
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
