//
//  HeartTake.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/20.
//

import SwiftUI

struct ShowHeart: View {

    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSetting

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            heartTake(chapterThreeUserValue.lifeCount)
        }
    }

    @ViewBuilder func heartTake(_ lifeCount: Int) -> some View {
        HStack {
            Spacer()
            if lifeCount > 0 {
                ForEach(1...lifeCount, id: \.self) { _ in
                    Image("findWrong_heartFill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

struct HeartTake_Previews: PreviewProvider {
    static var previews: some View {
        ShowHeart()
    }
}
