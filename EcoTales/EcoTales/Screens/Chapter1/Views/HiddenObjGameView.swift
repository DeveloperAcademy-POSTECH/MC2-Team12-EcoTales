//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
    var body: some View {
        ZStack {
            Image("chapterOne_pollutedBackground")
                .resizable()
                .scaledToFill()
            //                .onTouch(type: .started, perform: updateLocation)
            LocatingHiddenObjView()
            VStack {
                Spacer()
                ObjectsToFind()
            }
            VStack {
                TopCollocate()
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
    func updateLocation(_ location: CGPoint) {
        print(location)
    }
}

struct TopCollocate: View {
    @State private var showPopUp = false
    var body: some View {
        HStack {
            PauseEncounter()
                .frame(width: 50, height: 50)
            HStack {
                Spacer()
                Image("turtleCircle")
                    .resizable()
                    .frame(width: 50, height: 46)
                    .padding()
                ExplainGameView()
                Spacer()
            }
            .frame(width: 600, height: 50)
            Spacer()
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
                .background(Image("chapterOne_turtleDialog")
                )
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
