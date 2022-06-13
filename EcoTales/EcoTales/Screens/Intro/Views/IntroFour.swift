//
//  IntroFour.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroFour: View {
    @State private var dialogIndex = 0
    @Binding var introNumber: Int
    var body: some View {
        ZStack {
            Image("intro4_background")
                .resizable()
                .ignoresSafeArea()
            HStack {
                VStack {
                    Text(StoryData().introFour[0])
                        .font(.system(size: 20))
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                            .opacity(dialogIndex == 0 ? 1 : 0)
                    }
                    Text(StoryData().introFour[1])
                        .font(.system(size: 20))
                        .opacity(dialogIndex >= 1 ? 1 : 0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 1 ? 1 : 0)
                    Text(StoryData().introFour[2])
                        .font(.system(size: 20))
                        .opacity(dialogIndex == 2 ? 1 :0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.system(size: 20))
                    }
                    .opacity(dialogIndex == 2 ? 1 :0)
                }
            }
            .padding(.horizontal, 50)
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

//struct IntroFour_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroFour()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
