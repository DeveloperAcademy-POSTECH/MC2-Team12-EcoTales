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
    @Binding var isStagePopup: Bool
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
                    if chapterStory().speaker[storyIndex] == .child {
                        Image(ImageLiteral.child)
                            .resizable()
                            .scaledToFit()
                    }
                    if chapterStory().speaker[storyIndex] == .chapter1Photo {
                        Image("chapter1_photo")
                            .resizable()
                            .frame(width: 540, height: 330)
                    }
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
                        if chapterStory().speaker[storyIndex] != .naration && chapterStory().speaker[storyIndex] != .chapter1Photo {
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
            return AnyView(HiddenObjGameView(isGameClear: self.$isGameClear, isStagePopup: $isStagePopup))
        case .two:
            return AnyView(RecycleGameView(isGameClear: self.$isGameClear))
        case .three:
            return AnyView(FindWrongGameView(isStagePopup: $isStagePopup, isGameClear: $isGameClear))
        case .four:
            return AnyView(PandaGameView(isStagePopup: $isStagePopup, isGameClear: $isGameClear))
        default:
            return AnyView(HiddenObjGameView(isGameClear: self.$isGameClear, isStagePopup: $isStagePopup))
        }
    }

    func speakCharacter() -> some View {
        switch chapterStory()
            .speaker[storyIndex] {
        case .turtle, .rain:
            return AnyView(Image(ImageLiteral.rain))
        case .mole, .dirtySherry:
            return AnyView(Image(ImageLiteral.mole)
                .padding(.bottom, 80))
        case .sherry:
            return AnyView(Image(ImageLiteral.sherry)
                .padding(.bottom, 80))
        case .ozz:
            return AnyView(Image(ImageLiteral.ozz))
        case .meenu:
            return AnyView(Image(ImageLiteral.meenu))
        case .redpandaA, .redpandaB, .redpandaC:
            return AnyView(Image(ImageLiteral.redPanda))
        case .redpandaAll:
            return AnyView(Image(ImageLiteral.redPandas))
        default:
            return AnyView(Image(ImageLiteral.child).resizable().frame(width: 0, height: 0))
        }
    }
}
