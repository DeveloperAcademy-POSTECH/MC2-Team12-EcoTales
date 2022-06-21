//
//  FindWrongScreenView.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/20.
//

import SwiftUI

struct FindWrongScreenView: View {

    @EnvironmentObject var chapterThreeUserValue: ChapterThreeUserSetting
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
                            secondCircle: CGPoint(x: 220, y: 140), circleSize: 120)
            findWrongButton(2, firstCircle: CGPoint(x: 520, y: 20),
                            secondCircle: CGPoint(x: 140, y: 20), circleSize: 60)
            findWrongButton(3, firstCircle: CGPoint(x: 540, y: 265),
                            secondCircle: CGPoint(x: 170, y: 265), circleSize: 70)
            findWrongButton(4, firstCircle: CGPoint(x: 590, y: 250),
                            secondCircle: CGPoint(x: 220, y: 250), circleSize: 70)
        }
    }

    @ViewBuilder func findWrongButton( _ circleNum: Int, firstCircle: CGPoint,
                                       secondCircle: CGPoint, circleSize: CGFloat) -> some View {
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
        .position(firstCircle)

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
        .position(secondCircle)
    }
}
