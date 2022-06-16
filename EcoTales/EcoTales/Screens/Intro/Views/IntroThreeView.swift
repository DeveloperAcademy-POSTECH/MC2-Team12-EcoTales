//
//  IntroThree.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroThreeView: View {
    @State private var dialogIndex = 0
    @Binding var introNumber: Int
    var body: some View {
        ZStack {
            HStack {
                Image("intro3_background")
                Spacer()
            }
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    if dialogIndex / 3 == 0 {
                        Text(StoryData().introThree[0])
                            .font(.system(size: 20))
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                                .opacity(dialogIndex == 0 ? 1 : 0)
                        }
                        Text(StoryData().introThree[1])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 1 ? 1 : 0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 1 ? 1 : 0)
                        Text(StoryData().introThree[2])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 2 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 2 ? 1 :0)
                    } else {
                        Text(StoryData().introThree[3])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 3 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 3 ? 1 :0)
                        Text(StoryData().introThree[4])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 4 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 4 ? 1 :0)
                    }
                    Text(StoryData().introThree[5])
                        .font(.system(size: 20))
                        .opacity(dialogIndex == 5 ? 1 :0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 5 ? 1 :0)
                }
                .padding(.trailing, 50)
                .padding(.top, 30)
                .frame(width: 450)
            }
        }
        .onTapGesture {
            if dialogIndex == StoryData().introTwo.count - 1 {
                introNumber += 1
            } else {
                dialogIndex += 1
            }
        }
    }
}
