//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
    @State private var isShowingPopup = false
    var body: some View {
        ZStack {
            Image("chapter1_pollutedBackground")
                .backgroundImage()
            ObjectsHiddenView()
            VStack {
                Spacer()
                ObjectsToFindView()
            }
            VStack {
                UpperPanelView(isShowingPopUp: $isShowingPopup)
                Spacer()
            }
            if isShowingPopup {
                StoryPopup(isShowingPopup: $isShowingPopup)
            }
        }
        .ignoresSafeArea()
    }
    func updateLocation(_ location: CGPoint) {
        print(location)
    }
}

struct UpperPanelView: View {
    @Binding var isShowingPopUp: Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    self.isShowingPopUp = true
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

struct ExplainGameView: View {
    var body: some View {
        ZStack {
            // text 받아오는 함수 위치
            Text("설명을 해줄게!")
                .background(Image("chapter1_turtleDialog"))
        }
        .frame(width: 450, height: 30)
    }
}

extension View {
    func onTouch(type: TouchLocatingView.TouchType = .all, limitToBounds: Bool = true,
                 perform: @escaping (CGPoint) -> Void) -> some View {
        self.modifier(TouchLocater(type: type, limitToBounds: limitToBounds, perform: perform))
    }
}

struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
