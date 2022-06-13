//
//  ChapterTwoLayout.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/13.
//

import SwiftUI

struct ChapterTwoLayout: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        Image("game_woodenPanel")
                            .resizable()
                            .scaledToFit()
                            .ignoresSafeArea()
                    }
                }
                ZStack {
                    Image("chapterTwo_background")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.5)
                }
            }
            VStack {
                Spacer()
                RecycleBins()
            }
        }
        .ignoresSafeArea()
    }
}

struct RecycleBins: View {
    var body: some View {
        HStack {
            Image("recycleBin_litter")
            Image("recycleBin_vinyl")
            Image("recycleBin_can")
            Image("recycleBin_plastic")
            Image("recycleBin_paper")
            Image("recycleBin_glass")
        }
    }
}

struct ChapterTwoLayout_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTwoLayout()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
