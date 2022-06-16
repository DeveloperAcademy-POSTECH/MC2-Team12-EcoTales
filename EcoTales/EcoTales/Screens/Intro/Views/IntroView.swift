//
//  IntroView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

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
    @State private var introStoryIndex = 0
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ZStack {
            Image(selectIntroBackground(introNumber: self.introNumber))
                .backgroundImage()
            HStack {
                if introNumber == 3 {
                    Spacer()
                }
                VStack(alignment: introNumber == 4 ? .center : .leading, spacing: 10) {
                    Text(selectIntroStory(introNumber: self.introNumber)[introStoryIndex / 3 * 3 + 0])
                        .font(.custom("SeoulHangangM", size: 20))
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음 ☞")
                            .font(.custom("SeoulHangangM", size: 20))
                    }
                    .opacity(introStoryIndex.isMultiple(of: 3) ? 1 : 0)
                    Text(selectIntroStory(introNumber: self.introNumber)[introStoryIndex / 3 * 3 + 1])
                        .font(.custom("SeoulHangangM", size: 20))
                        .opacity(introStoryIndex % 3 >= 1 ? 1 : 0)
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음 ☞")
                            .font(.custom("SeoulHangangM", size: 20))
                    }
                    .opacity(introStoryIndex % 3 == 1 ? 1 : 0)
                    Text(selectIntroStory(introNumber: self.introNumber)[introStoryIndex / 3 * 3 + 2])
                        .font(.custom("SeoulHangangM", size: 20))
                        .opacity(introStoryIndex % 3 >= 2 ? 1 : 0)
                    HStack {
                        if introNumber != 4 {
                            Spacer()
                        }
                        Text("다음 ☞")
                            .font(.custom("SeoulHangangM", size: 20))
                    }
                    .opacity(introStoryIndex % 3 == 2 ? 1 : 0)
                }
                .frame(maxWidth: introNumber == 4 ? .infinity : UIScreen.main.bounds.width * 0.45)
                if introNumber == 1 || introNumber == 2 {
                    Spacer()
                }
            }
        }
        .onTapGesture {
            if introStoryIndex == selectIntroStory(introNumber: self.introNumber).count - 1 {
                introNumber += 1
                introStoryIndex = 0
            } else {
                introStoryIndex += 1
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
