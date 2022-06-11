//
//  StoryView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/10.
//
import SwiftUI

func selectStory(chapter: Int, isGameClear: Bool) -> ChapterStory {
    switch chapter {
    case 0:
        return chapterIntro
    case 1:
        return isGameClear ? chapterOneClear : chapterOneNotClear
    case 2:
        return isGameClear ? chapterTwoClear : chapterTwoNotClear
    case 3:
        return isGameClear ? chapterThreeClear : chapterThreeNotClear
    case 4:
        return isGameClear ? chapterFourClear : chapterFourNotClear
    case 5:
        return chapterEpilogue
    default:
        return chapterError
    }
}

struct StoryView: View {
    @State private var isGameClear = false
    @State private var storyIndex = 0
    @Binding var chapter: Int
    @Binding var num: Int
    var body: some View {
        ZStack {
            Image("ChapterOneBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            // 배경
            HStack {
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker[storyIndex].rawValue == "레인" {
                    Image("Rain")
                        .resizable()
                        .frame(width: 150.0, height: 240.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker[storyIndex].rawValue == "거북이" {
                    Image("Rain")
                        .resizable()
                        .frame(width: 150.0, height: 240.0)
                }
                Spacer()
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker[storyIndex].rawValue == "아이" {
                    Image("MainCharacter")
                        .resizable()
                        .frame(width: 140.0, height: 250.0)
                }
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
                            Image("ConversationField")
                                .resizable()
                                .frame(width: 750, height: 150)
                        )
                        .padding(.top, 45)
                    if selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker[storyIndex].rawValue != "나레이션" {
                        Text(selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker[storyIndex].rawValue)
                            .frame(width: 120, height: 30, alignment: .center)
                            .lineSpacing(10)
                            .background(
                                Image("ConversationNameField")
                                    .resizable()
                                    .frame(width: 140, height: 50)
                            )
                    }
                }
            }
            .padding(.bottom, 30)
        }
        .onTapGesture {
            if storyIndex == (selectStory(chapter: self.chapter, isGameClear: self.isGameClear).speaker.count - 1) {
                
            }
            else {
                storyIndex += 1
            }
        }
    }
}

//struct StoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryView()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
