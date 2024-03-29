//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {

    @EnvironmentObject var chapterProgress: ChapterProgress
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isGameClear: Bool
    @Binding var isStagePopup: Bool
    @State private var isPausePopup = false
    @State private var foundTrash = Set<String>()
    @State private var isHiddenObjGameClear = false

    var body: some View {
        ZStack {
            if foundTrash.count == 10 {
                withAnimation(Animation.easeInOut(duration: 1)) {
                    Image(ImageLiteral.chapter1CleanBackground)
                    .resizable()
                    .scaledToFill()
                }
            } else {
                Image(ImageLiteral.chapter1PollutedBackground)
                    .resizable()
                    .scaledToFill()
            }
            ObjectsHiddenView(foundTrash: $foundTrash)
            VStack {
                Spacer()
                ObjectsToFindView(foundTrash: $foundTrash)
            }
            if foundTrash.count == 10 {
                Image(ImageLiteral.gameClear)
                    .resizable()
                    .padding(50)
                    .scaledToFit()
                    .onTapGesture {
                        isHiddenObjGameClear.toggle()
                        isGameClear = true
                        presentationMode.wrappedValue.dismiss()
                        chapterProgress.completionStatus[.one] = true
                    }
            }
            VStack {
                UpperPanelView(isPausePopup: $isPausePopup)
                Spacer()
            }
            if isPausePopup {
                StoryPopup(isStagePopup: $isStagePopup, isPausePopup: $isPausePopup)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

private struct UpperPanelView: View {
    @Binding var isPausePopup: Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    self.isPausePopup = true
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

struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView(isGameClear: .constant(true), isStagePopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
