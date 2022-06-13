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
                        ZStack {
                            Image("game_woodenPanel")
                                .resizable()
                                .scaledToFit()
                                .ignoresSafeArea()
                            HStack {
                                //TODO: 현재 레이아웃으로 넣긴 했으나, 눌렀을 때 팝업이 뜨는 기능이 이루어지지 않는다. 33줄에 .opacity(0.5)를 넣으면 희미하지만 나타난다.
                                PauseEncounter()
                                    .frame(width: 20, height: 20)
                                Spacer()
                                
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                }
                ZStack {
                    Image("chapterTwo_background")
                        .resizable()
                        .ignoresSafeArea()
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
