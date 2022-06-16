//
//  FindWrongGameView.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/16.
//

import SwiftUI

struct FindWrongGameView: View {
    @Binding var isMapPopup: Bool
    @State private var isStoryPopup = false
    var body: some View {
        ZStack {
            Image("chapter3_GameWoodPanel")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 0) {
                UpperPanelView(isStoryPopup: $isStoryPopup)
                    .padding(.vertical, 5)
                Image("chapter3_GameBackground")
                    .resizable()
            }
            .padding(.horizontal, 44)
            Image("Chapter3_tape")
                .resizable()
                .allowsHitTesting(false)
            if isStoryPopup {
                StoryPopup(isMapPopup: $isMapPopup, isStoryPopup: $isStoryPopup)
            }
        }
        .ignoresSafeArea()
    }
}

private struct UpperPanelView: View {
    @Binding var isStoryPopup: Bool
    var body: some View {
        HStack {
            Button(action: {
                self.isStoryPopup = true
            }, label: {})
            .buttonStyle(PauseButtonStyle())
            Spacer()
            Image("chapter3_owlHeadCircle")
                .frame(width: 50, height: 50)
            Spacer()
            ExplainGameView()
            Spacer()
            HeartTake()
        }
    }
}

private struct ExplainGameView: View {
    var body: some View {
        ZStack {
            Text("자동차 매연은 대기오염을 시켜!")
                .background(Image("chapter1_turtleDialog"))
        }
        .frame(width: 450, height: 30)
    }
}

private struct HeartTake: View {
    var body: some View {
        HStack {
            Image("findWrong_heartEmpty")
            Image("findWrong_heartFill")
            Image("findWrong_heartFill")
        }
    }
}

struct FindWrongGameView_Previews: PreviewProvider {
    static var previews: some View {
        FindWrongGameView(isMapPopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
