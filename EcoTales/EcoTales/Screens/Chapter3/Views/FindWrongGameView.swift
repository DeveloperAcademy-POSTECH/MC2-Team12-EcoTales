//
//  FindWrongGameView.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/16.
//

import SwiftUI

class ChapterThreeUserSettings: ObservableObject {
    @Published var circleScore = 0
    @Published var isShowCircle = Array(repeating: false, count: 5)
    @Published var lifeCount = 3
}

struct FindWrongGameView: View {
    @Binding var isMapPopup: Bool
    @State private var isStoryPopup = false
    @State private var isFindWrongClear = false
    @StateObject private var chapterThreeUserValue = ChapterThreeUserSettings()
    var body: some View {
        ZStack {
            Image("chapter3_GameWoodPanel")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 0) {
                UpperPanelView(isStoryPopup: $isStoryPopup)
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
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                Image("gameOver")
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: { isMapPopup = false })
                    }
            }
            if isFindWrongClear {
                // Game Clear
                ZStack {
                    Color.black.opacity(0.4)
                    Image("gameClear")
                        .resizable()
                        .scaledToFit()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: { isMapPopup = false })
                        }
                }
                .ignoresSafeArea()
            }
            if isStoryPopup {
                ChapterThreeStoryPopup(isMapPopup: $isMapPopup, isStoryPopup: $isStoryPopup)
                    .environmentObject(chapterThreeUserValue)
                    .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

private struct UpperPanelView: View {
    @Binding var isStoryPopup: Bool
    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSettings
    var body: some View {
        HStack {
            Button(action: {
                self.isStoryPopup = true
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
    @ViewBuilder
    func heartTake( _ lifeCounter: Int) -> some View {
        HStack {
            Spacer()
            if lifeCounter > 0 {
                ForEach(1...lifeCounter, id: \.self) { _ in
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
            findWrongButton(0, x1: 405, y1: 198, x2: 30, y2: 198, circleSize: 140)
            findWrongButton(1, x1: 580, y1: 140, x2: 210, y2: 140, circleSize: 120)
            findWrongButton(2, x1: 505, y1: 20, x2: 135, y2: 20, circleSize: 60)
            findWrongButton(3, x1: 520, y1: 280, x2: 150, y2: 280, circleSize: 70)
            findWrongButton(4, x1: 570, y1: 260, x2: 200, y2: 260, circleSize: 70)
        }
    }

    @ViewBuilder func findWrongButton( _ circleNum: Int, x1 positionX1: Int, y1 positionY1: Int,
                          x2 positionX2: Int, y2 positionY2: Int, circleSize: Int
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
                .frame(width: CGFloat(circleSize), height: CGFloat(circleSize))
                .opacity(chapterThreeUserValue.isShowCircle[circleNum] ? 1.0 : 0.0)
        }
        .position(x: CGFloat(positionX1), y: CGFloat(positionY1))
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
                .frame(width: CGFloat(circleSize), height: CGFloat(circleSize))
                .opacity(chapterThreeUserValue.isShowCircle[circleNum] ? 1.0 : 0.0)
        }
        .position(x: CGFloat(positionX2), y: CGFloat(positionY2))
    }
}

struct FindWrongGameView_Previews: PreviewProvider {
    static var previews: some View {
        FindWrongGameView(isMapPopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
