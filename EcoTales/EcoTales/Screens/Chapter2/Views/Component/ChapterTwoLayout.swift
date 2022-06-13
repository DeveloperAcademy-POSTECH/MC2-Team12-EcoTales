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
        let recyleBins = ["recycleBin_litter", "recycleBin_vinyl", "recycleBin_can", "recycleBin_plastic", "recycleBin_paper", "recycleBin_glass"]
        HStack {
            ForEach(0..<recyleBins.count) { index in
                if index == 0 {
                    Image(recyleBins[index])
                    Spacer()
                } else if index == recyleBins.count - 1 {
                    Spacer()
                    Image(recyleBins[index])
                } else {
                    Spacer()
                    Image(recyleBins[index])
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 30)
    }
}

struct ChapterTwoLayout_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTwoLayout()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
