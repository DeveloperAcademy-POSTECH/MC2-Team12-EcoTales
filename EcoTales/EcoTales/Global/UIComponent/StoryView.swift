//
//  StoryView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/10.
//
import SwiftUI

func selectStory(chapter: Int, isGameClear: Bool) -> StoryData {
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
    @State private var storyIndex = 0
    @Binding var chapter: Int
    @Binding var isGameClear: Bool
    @Binding var num: Int
    var body: some View {
        ZStack {
            if chapter == 1 {
                Image("chapterOne_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            if chapter == 2 {
                Image("chapterTwo_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            if chapter == 3 {
                Image("chapterThree_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            if chapter == 4 {
                Image("chapterFour_background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            }
            // 배경
            HStack {
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "레인" ||
                    selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "거북이" {
                    Image("character_rain")
                        .resizable()
                        .frame(width: 150.0, height: 240.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "쉐리" && isGameClear == true {
                    Image("character_sherry")
                        .padding(.bottom, 60)
//                        .resizable()
//                        .frame(width: 140.0, height: 250.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "두더지" ||
                    (selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "쉐리" && isGameClear == false) {
                    Image("character_mole")
                        .padding(.bottom, 60)
//                        .resizable()
//                        .frame(width: 140.0, height: 250.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "오즈" {
                    Image("character_oz")
                        .resizable()
                        .frame(width: 140.0, height: 250.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "미뉴" {
                    Image("character_meenu")
                        .resizable()
                        .frame(width: 140.0, height: 250.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "레서 판다 A" ||
                    selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "레서 판다 B" ||
                    selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "레서 판다 C" {
                    Image("character_redPanda")
                        .resizable()
                        .frame(width: 140.0, height: 250.0)
                }
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "레서 판다 A, B, C" {
                    Image("character_redPandas")
                        .resizable()
                        .frame(width: 140.0, height: 250.0)
                }
                Spacer()
                if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                    .speaker[storyIndex].rawValue == "아이" {
                    Image("character_child")
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
                            Image("global_dialogField")
                                .resizable()
                                .frame(width: 750, height: 150)
                        )
                        .padding(.top, 45)
                    if selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                        .speaker[storyIndex].rawValue != "나레이션" {
                        Text(selectStory(chapter: self.chapter, isGameClear: self.isGameClear)
                            .speaker[storyIndex].rawValue)
                            .frame(width: 120, height: 30, alignment: .center)
                            .lineSpacing(10)
                            .background(
                                Image("global_nameField")
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
                num += 1
                storyIndex = 0
            } else {
                storyIndex += 1
            }
        }
    }
}

// struct StoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoryView()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
// }
