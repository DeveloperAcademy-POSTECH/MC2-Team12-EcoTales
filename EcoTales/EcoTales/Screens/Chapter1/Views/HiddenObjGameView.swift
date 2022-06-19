//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
<<<<<<< HEAD
<<<<<<< HEAD
    @State private var isShowingPopup = false
    @Binding var isGameClear: Bool
    var body: some View {
        ZStack {
            Image(ImageLiteral.chapter1PollutedBackground)
                .backgroundStyle()
            ObjectsHiddenView()
=======
=======
>>>>>>> main
    @Binding var isStagePopup: Bool
    @State private var isPausePopup = false
    @State private var foundTrash = Set<String>()
    @State private var isHiddenObjGameClear = false
    var body: some View {
        ZStack {
            if foundTrash.count == 10 {
                withAnimation(Animation.easeInOut(duration: 1)) {
                Image("chapterOne_cleanBackground")
                    .resizable()
                    .scaledToFill()
                }
            } else {
                Image("chapterOne_pollutedBackground")
                    .resizable()
                    .scaledToFill()
            }
            ObjectsHiddenView(foundTrash: $foundTrash)
<<<<<<< HEAD
>>>>>>> main
=======
>>>>>>> main
            VStack {
                Spacer()
                ObjectsToFindView(foundTrash: $foundTrash)
            }
            if foundTrash.count == 10 {
                Text("완료!") // 스테이지 클리어 이미지로 교체 예정
                    .onTapGesture {
                        isHiddenObjGameClear.toggle()
                    }
            }
            VStack {
                UpperPanelView(isCloseStoryPopup: $isPausePopup)
                Spacer()
            }
            if isPausePopup {
                StoryPopup(isStagePopup: $isStagePopup, isPausePopup: $isPausePopup)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
<<<<<<< HEAD
<<<<<<< HEAD
    }
    func updateLocation(_ location: CGPoint) {
        print(location)
=======
>>>>>>> main
=======
>>>>>>> main
    }
}

private struct UpperPanelView: View {
    @Binding var isCloseStoryPopup: Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    self.isCloseStoryPopup = true
                }, label: {})
                .buttonStyle(PauseButtonStyle())
                Spacer()
            }
            HStack {
                Spacer()
                Image("chapter1_turtleHeadCircle")
                    .resizable()
                    .frame(width: 50, height: 46)
                    .padding()
                ExplainGameView()
                Spacer()
            }
            .padding(.trailing, 100)
        }
        .padding([.trailing, .leading], 44)
        .background(Image("game_woodenPanel"))
        .frame(height: 50)
    }
}

private struct ExplainGameView: View {
    var body: some View {
        ZStack {
            // text 받아오는 함수 위치
            Text("설명을 해줄게!")
                .background(Image(ImageLiteral.chapter1TurtleDialog))
        }
        .frame(width: 450, height: 30)
    }
}

<<<<<<< HEAD
<<<<<<< HEAD
extension View {
    func onTouch(type: TouchLocatingView.TouchType = .all, limitToBounds: Bool = true,
                 perform: @escaping (CGPoint) -> Void) -> some View {
        self.modifier(TouchLocater(type: type, limitToBounds: limitToBounds, perform: perform))
=======
=======
>>>>>>> main
struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView(isStagePopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
<<<<<<< HEAD
>>>>>>> main
=======
>>>>>>> main
    }
}
