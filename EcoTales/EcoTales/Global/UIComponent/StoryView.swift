//
//  StoryView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/10.
//
import SwiftUI

struct StoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var storyIndex = 0
    @State private var isGameShow = false
    @State private var isGameClear = false
    @Binding var chapter: Chapter

    var body: some View {
        NavigationView {
            ZStack {
                Image(chapterBackground())
                    .backgroundStyle()
                    .aspectRatio(contentMode: .fill)

                HStack {
                    speakCharacter()
                    Spacer()
                    Image(ImageLiteral.child)
                        .resizable()
                        .scaledToFit()
                }
                .padding(EdgeInsets(top: 50, leading: 70, bottom: 10, trailing: 70))

                VStack {
                    Spacer()
                    ZStack(alignment: .topLeading) {
                        Text(chapterStory().dialog[storyIndex])
                            .frame(width: 650, height: 80, alignment: .topLeading)
                            .lineSpacing(10)
                            .background(
                                Image(ImageLiteral.dialogField)
                                    .resizable()
                                    .frame(width: 750, height: 150)
                            )
                            .padding(.top, 45)
                        if chapterStory().speaker[storyIndex] != .naration {
                            Text(chapterStory().speaker[storyIndex].speakerName())
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
                                   destination: { chapterGame() },
                                   label: {
                        Text("a")
                    })
                }
            }
            .onTapGesture {
                if storyIndex == (chapterStory()
                    .speaker.count - 1) {
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
        .navigationBarHidden(true)
    }

    func chapterStory() -> StoryDataModel {
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
        }
    }

    func chapterBackground() -> String {
        switch chapter {
        case .one:
            return isGameClear ? ImageLiteral.chapter1CleanBackground : ImageLiteral.chapter1PollutedBackground
        case .two:
            return isGameClear ? ImageLiteral.chapter2CleanBackground : ImageLiteral.chapter2PollutedBackground
        case .three:
            return isGameClear ? ImageLiteral.chapter3CleanBackground : ImageLiteral.chapter3Pollutedbackground
        case .four:
            return ImageLiteral.chapter4Background
        default:
            return ImageLiteral.chapter1PollutedBackground
        }
    }

    func chapterGame() -> some View {
        switch chapter {
        case .one:
            return HiddenObjGameView(isGameClear: self.$isGameClear)
//        case .two:
//            return
//        case .three:
//            return
//        case .four:
//            return
        default:
            return HiddenObjGameView(isGameClear: self.$isGameClear)
        }
    }

    func speakCharacter() -> some View {
        switch chapterStory()
            .speaker[storyIndex] {
        case .turtle, .rain:
            return Image(ImageLiteral.rain)
        case .mole, .dirtySherry:
            return Image(ImageLiteral.mole)
        case .sherry:
            return Image(ImageLiteral.sherry)
        case .ozz:
            return Image(ImageLiteral.ozz)
        case .meenu:
            return Image(ImageLiteral.meenu)
        case .redpandaA, .redpandaB, .redpandaC:
            return Image(ImageLiteral.redPanda)
        case .redpandaAll:
            return Image(ImageLiteral.redPandas)
        default:
            return Image(ImageLiteral.child)
        }
    }
}
