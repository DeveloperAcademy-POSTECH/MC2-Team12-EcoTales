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

private struct HeartTake: View {
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
                Image("findWrong_heartEmpty")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            HStack {
                heartTake( chapterThreeUserValue.lifeCount )
            }
        }
    }
    @ViewBuilder func heartTake( _ lifeCount: Int) -> some View {
        HStack {
            Spacer()
            if lifeCount > 0 {
                ForEach(1...lifeCount, id: \.self) { _ in
                    Image("findWrong_heartFill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

private struct FindWrongScreenView: View {
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings
    @Binding var isFindWrongClear: Bool
    var body: some View {
        ZStack {
            Image("chapter3_GameBackground")
                .resizable()
                .onTapGesture {
                    chapterThreeUserValue.lifeCount -= 1
                }
            findWrongButton(0, firstCircle: CGPoint(x: 405, y: 198),
                            secondCircle: CGPoint(x: 30, y: 198), circleSize: 140)
            findWrongButton(1, firstCircle: CGPoint(x: 580, y: 140),
                            secondCircle: CGPoint(x: 210, y: 140), circleSize: 120)
            findWrongButton(2, firstCircle: CGPoint(x: 505, y: 20),
                            secondCircle: CGPoint(x: 135, y: 20), circleSize: 60)
            findWrongButton(3, firstCircle: CGPoint(x: 520, y: 280),
                            secondCircle: CGPoint(x: 150, y: 280), circleSize: 70)
            findWrongButton(4, firstCircle: CGPoint(x: 570, y: 260),
                            secondCircle: CGPoint(x: 200, y: 260), circleSize: 70)
        }
    }
    @ViewBuilder func findWrongButton( _ circleNum: Int, firstCircle: CGPoint,
                                       secondCircle: CGPoint, circleSize: CGFloat
    ) -> some View {
        Button {
            chapterThreeUserValue.isShowCircle[circleNum] = true
            chapterThreeUserValue.circleScore = circleNum
            let sum = chapterThreeUserValue.isShowCircle.reduce(true) {
                $0 && $1
            }
            if sum {
                isFindWrongClear = true
            }
        } label: {
            Image(systemName: "circle")
                .resizable()
                .frame(width: circleSize, height: circleSize)
                .opacity(chapterThreeUserValue.isShowCircle[circleNum] ? 1.0 : 0.0)
        }
        .position(x: firstCircle.x, y: firstCircle.y)
        Button {
            chapterThreeUserValue.isShowCircle[circleNum] = true
            chapterThreeUserValue.circleScore = circleNum
            let sum = chapterThreeUserValue.isShowCircle.reduce(true) {
                $0 && $1
            }
            if sum {
                isFindWrongClear = true
            }
        } label: {
            Image(systemName: "circle")
                .resizable()
                .frame(width: circleSize, height: circleSize)
                .opacity(chapterThreeUserValue.isShowCircle[circleNum] ? 1.0 : 0.0)
        }
        .position(x: secondCircle.x, y: secondCircle.y)
    }
}

struct FindWrongGameView_Previews: PreviewProvider {
    static var previews: some View {
        FindWrongGameView(isStagePopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}