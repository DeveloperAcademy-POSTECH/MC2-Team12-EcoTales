//
//  IntroView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

extension Image: ViewModifier {
    func backgroundImage() -> some View {
        self
            .resizable()
            .ignoresSafeArea()
    }
}

func selectIntroBackground(introNumber: Int) -> String {
    switch introNumber {
    case 1:
        return "intro1_background"
    case 2:
        return "intro2_background"
    case 3:
        return "intro3_background"
    case 4:
        return "intro4_background"
    default:
        return "intro1_background"
    }
}

func selectIntroStory(introNumber: Int) -> [String] {
    switch introNumber {
    case 1:
        return StoryData().introOne
    case 2:
        return StoryData().introTwo
    case 3:
        return StoryData().introThree
    case 4:
        return StoryData().introFour
    default:
        return ["Error!", "Error!", "Error!"]
    }
}

struct IntroView: View {
    @State private var introNumber = 1
    @State private var introIndex = 0
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ZStack {
            Image(selectIntroBackground(introNumber: self.introNumber))
                .backgroundImage()
            HStack {
                if introNumber == 3 {
                    Spacer()
                        .frame(width: screenWidth / 2)
                }
                VStack(alignment: introNumber == 4 ? .center : .leading, spacing: 10) {
                    Text(selectIntroStory(introNumber: self.introNumber)[introIndex / 3 * 3 + 0])
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음")
                    }
                    .opacity(introIndex.isMultiple(of: 3) ? 1 : 0)
                    Text(selectIntroStory(introNumber: self.introNumber)[introIndex / 3 * 3 + 1])
                        .opacity(introIndex % 3 >= 1 ? 1 : 0)
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음")
                    }
                    .opacity(introIndex % 3 == 1 ? 1 : 0)
                    Text(selectIntroStory(introNumber: self.introNumber)[introIndex / 3 * 3 + 2])
                        .opacity(introIndex % 3 >= 2 ? 1 : 0)
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음")
                    }
                    .opacity(introIndex % 3 == 2 ? 1 : 0)
                }
                if introNumber == 1 || introNumber == 2 {
                    Spacer()
                        .frame(width: screenWidth / 2)
                }
            }
        }
        .onTapGesture {
            if introIndex == selectIntroStory(introNumber: self.introNumber).count - 1 {
                introNumber += 1
                introIndex = 0
            } else {
                introIndex += 1
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
