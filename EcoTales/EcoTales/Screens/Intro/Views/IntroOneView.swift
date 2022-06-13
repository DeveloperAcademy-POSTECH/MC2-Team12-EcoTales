//
//  IntroOne.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroOneView: View {
    @State private var dialogIndex = 0
    @Binding var introNumber: Int
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("intro1_background")
            }
            HStack {
                VStack(alignment: .leading) {
                    Text(StoryData().introOne[0])
                        .font(.system(size: 20))
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                            .opacity(dialogIndex == 0 ? 1 : 0)
                    }
                    Text(StoryData().introOne[1])
                        .font(.system(size: 20))
                        .opacity(dialogIndex >= 1 ? 1 : 0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 1 ? 1 : 0)
                    Text(StoryData().introOne[2])
                        .font(.system(size: 20))
                        .opacity(dialogIndex == 2 ? 1 :0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 2 ? 1 :0)
                }
                .frame(width: 400)
                Spacer()
            }
        }
        .onTapGesture {
            if dialogIndex == StoryData().introOne.count - 1 {
                introNumber += 1
            } else {
                dialogIndex += 1
            }
        }
    }
}
