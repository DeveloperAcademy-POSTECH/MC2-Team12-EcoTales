//
//  IntroView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct IntroView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var introNumber = 1
    @State private var introStoryIndex = 0
    @Binding var isIntroSeen: Bool
    let screenWidth = UIScreen.main.bounds.size.width

    var body: some View {
        ZStack {
            Image(introBackground())
                .backgroundStyle()
            HStack {
                if introNumber == 3 {
                    Spacer()
                }
                VStack(alignment: introNumber != 4 ? .leading : .center) {
                    Text(introStoryContent(position: 0))
                        .font(.seoulHangangM.story)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.seoulHangangM.story)
                    }
                    .opacity(introStoryIndex.isMultiple(of: 3) ? 1 : 0)
                    Text(introStoryContent(position: 1))
                        .font(.seoulHangangM.story)
                        .opacity(introStoryIndex % 3 >= 1 ? 1 : 0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.seoulHangangM.story)
                    }
                    .opacity(introStoryIndex % 3 == 1 ? 1 : 0)
                    Text(introStoryContent(position: 2))
                        .font(.seoulHangangM.story)
                        .opacity(introStoryIndex % 3 >= 2 ? 1 : 0)
                    HStack {
                        Spacer()
                        Text("다음")
                            .font(.seoulHangangM.story)
                    }
                    .opacity(introStoryIndex % 3 == 2 ? 1 : 0)
                }
                .frame(width: screenWidth * 0.45)
                if introNumber == 1 || introNumber == 2 {
                    Spacer()
                }
            }
        }
        .onTapGesture {
            if introStoryIndex == introStory().count - 1 {
                if introNumber == 4 {
                    isIntroSeen = true
//                    chapterProgress.completionStatus[.zero] = true
                    presentationMode.wrappedValue.dismiss()
                } else {
                    introNumber += 1
                    introStoryIndex = 0
                }
            } else {
                introStoryIndex += 1
            }
        }
    }

    func introBackground() -> String {
        switch introNumber {
        case 1:
            return ImageLiteral.intro1Background
        case 2:
            return ImageLiteral.intro2Background
        case 3:
            return ImageLiteral.intro3Background
        case 4:
            return ImageLiteral.intro4Background
        default:
            return ImageLiteral.intro1Background
        }
    }

    func introStory() -> [String] {
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

    func introStoryContent(position: Int) -> String {
        return introStory()[introStoryIndex / 3 * 3 + position]
    }
}
