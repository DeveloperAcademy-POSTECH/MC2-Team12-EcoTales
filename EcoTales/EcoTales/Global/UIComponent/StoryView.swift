//
//  StoryView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/10.
//
import SwiftUI

func selectStory(chapter: Chapter, isGameClear: Bool) -> StoryDataModel {
    switch chapter {
    case .zero:
        return StoryData().chapterIntro
    case .one:
        return isGameClear ? StoryData().chapterOneClear : StoryData().chapterOneNotClear
    case .two:
        return isGameClear ? StoryData().chapterTwoClear : StoryData().chapterTwoNotClear
    case .three:
        return isGameClear ? StoryData().chapterThreeClear : StoryData().chapterThreeNotClear
    case .four:
        return isGameClear ? StoryData().chapterFourClear : StoryData().chapterFourNotClear
    case .five:
        return StoryData().chapterEpilogue
    }
}

func selectBackground(chapter: Chapter, isGameClear: Bool) -> String {
    switch chapter {
    case .one:
        return isGameClear ? ImageLiteral.chapter1CleanBackground : ImageLiteral.chapter1PollutedBackground
    case .two:
        return ImageLiteral.chapter2Background
    case .three:
        return isGameClear ? ImageLiteral.chapter3CleanBackground : ImageLiteral.chapter3Pollutedbackground
    case .four:
        return ImageLiteral.chapter4Background
    default:
        return ImageLiteral.chapter1PollutedBackground
    }
}

struct StoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var storyIndex = 0
    @State private var isGameShow = false
    @Binding var chapter: Chapter
    @Binding var isGameClear: Bool
    var body: some View {
        NavigationView {
            ZStack {
                Image(selectBackground(chapter: self.chapter, isGameClear: self.isGameClear))
                    .backgroundImage()
                    .aspectRatio(contentMode: .fill)
                HStack {
    //
                }
                .padding(EdgeInsets(top: 50, leading: 70, bottom: 10, trailing: 70))
                // 이미지
                VStack {
                    Spacer()
                    ZStack(alignment: .topLeading) {
                        Text(selectStory(chapter: self.chapter, isGameClear: self.isGameClear).dialog[storyIndex])
                            .frame(width: 650, height: 80, alignment: .topLeading)
                            .lineSpacing(10)
                            .background(
                                Image(ImageLiteral.dialogField)
                                    .resizable()
                                    .frame(width: 750, height: 150)
                            )
                            .padding(.top, 45)
                        if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                            .speaker[storyIndex] != .naration {
                            Text(selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                                .speaker[storyIndex].speakerName())
                                .frame(width: 120, height: 30, alignment: .center)
                                .lineSpacing(10)
                                .background(
                                    Image(ImageLiteral.nameField)
                                        .resizable()
                                        .frame(width: 140, height: 50)
                                )
                        }
                    }
                }
                .padding(.bottom, 30)
                if isGameShow {
                    NavigationLink(isActive: self.$isGameShow,
                                   destination: { HiddenObjGameView(isGameClear: self.$isGameClear) },
                                   label: {
                        Text("a")
                    })
                }
            }
            .onTapGesture {
                if storyIndex == (selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker.count - 1) {
                    if isGameClear {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        isGameShow = true
                        storyIndex = 0
                    }
                } else {
                    storyIndex += 1
                }
            }
        }
    }
}
