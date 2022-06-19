//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
    @Binding var isCloseMapPopup: Bool
    @State private var isCloseStoryPopup = false
    var body: some View {
        ZStack {
            Image("chapter1_pollutedBackground")
                .resizable()
                .scaledToFill()
            ObjectsHiddenView()
            VStack {
                Spacer()
                ObjectsToFindView()
            }
            VStack {
                UpperPanelView(isCloseStoryPopup: $isCloseStoryPopup)
                Spacer()
            }
            if isCloseStoryPopup {
                StoryPopup(isCloseMapPopup: $isCloseMapPopup, isCloseStoryPopup: $isCloseStoryPopup)
            }
        }
        .ignoresSafeArea()
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
                .background(Image("chapter1_turtleDialog"))
        }
        .frame(width: 450, height: 30)
    }
}

struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView(isCloseMapPopup: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
