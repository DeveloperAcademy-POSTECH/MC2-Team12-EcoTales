//
//  FindWrongGameView.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/16.
//

import SwiftUI

struct FindWrongGameView: View {

    @Binding var isStagePopup: Bool
    @State private var isPausePopup = false
    @State private var isFindWrongClear = false
    @StateObject private var chapterThreeUserValue = ChapterThreeUserSettings()

    var body: some View {
        ZStack {
            Image("chapter3_GameWoodPanel")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {
                UpperPanelView(isCloseStoryPopup: $isPausePopup)
                    .environmentObject(chapterThreeUserValue)
                    .padding(.vertical, 5)
                FindWrongScreenView(isFindWrongClear: $isFindWrongClear)
                    .environmentObject(chapterThreeUserValue)
            }
            .padding(.horizontal, 44)

            Image("Chapter3_tape")
                .resizable()
                .allowsHitTesting(false)

            if chapterThreeUserValue.lifeCount < 1 {
                // Game Over
                Dim()
                Image("gameOver")
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: { isStagePopup = false })
                    }
            }

            if isFindWrongClear {
                // Game Clear
                ZStack {
                    Dim()
                    Image("gameClear")
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: { isStagePopup = false })
                        }
                }
                .ignoresSafeArea()
            }

            if isPausePopup {
                ChapterThreeStoryPopup(isStagePopup: $isStagePopup, isPausePopup: $isPausePopup)
                    .environmentObject(chapterThreeUserValue)
                    .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

private struct UpperPanelView: View {

    @Binding var isCloseStoryPopup: Bool
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings

    var body: some View {
        HStack {
            Button(action: {
                self.isCloseStoryPopup = true
            }, label: {})
            .buttonStyle(PauseButtonStyle())
            Spacer()
            Image("chapter3_owlHeadCircle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.horizontal, 10)
            Spacer()
            ExplainGameView()
            Spacer()
            HeartTake()
        }
    }
}

private struct ExplainGameView: View {

    private var owlLine = ["콜록! 콜록! 공장 매연은 나빠!", "공장 매연은 동물들에게 나빠!", "직구 배송을 주의하자!", "대중교통을 이용하자!", "자동차는 되도록 자제하자!"]
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings

    var body: some View {
        ZStack {
            Text(owlLine[chapterThreeUserValue.circleScore])
                .background(Image("chapter1_turtleDialog"))
        }
        .frame(width: 450, height: 30)
    }
}

struct FindWrongGameView_Previews: PreviewProvider {
    static var previews: some View {
        FindWrongGameView(isStagePopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
