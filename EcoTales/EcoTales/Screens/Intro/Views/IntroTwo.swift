//
//  IntroTwo.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroTwo: View {
    @State private var dialogIndex = 0
    @Binding var introNumber: Int
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("intro2_background")
            }
            HStack {
                VStack(alignment: .leading) {
                    if dialogIndex / 3 == 0 {
                        Text(StoryData().introTwo[0])
                            .font(.system(size: 20))
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                                .opacity(dialogIndex == 0 ? 1 : 0)
                        }
                        Text(StoryData().introTwo[1])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 1 ? 1 : 0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 1 ? 1 : 0)
                        Text(StoryData().introTwo[2])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 2 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 2 ? 1 :0)
                    } else {
                        Text(StoryData().introTwo[3])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 3 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 3 ? 1 :0)
                        Text(StoryData().introTwo[4])
                            .font(.system(size: 20))
                            .opacity(dialogIndex >= 4 ? 1 :0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.system(size: 20))
                        }
                        .opacity(dialogIndex == 4 ? 1 :0)
                    }
                    Text(StoryData().introTwo[5])
                        .font(.system(size: 20))
                        .opacity(dialogIndex == 5 ? 1 :0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 5 ? 1 :0)
                }
                .frame(width: 400)
                Spacer()
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

//struct IntroTwo_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroTwo()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
