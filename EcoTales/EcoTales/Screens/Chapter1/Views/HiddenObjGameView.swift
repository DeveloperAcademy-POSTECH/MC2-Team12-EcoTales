//
//  HiddenObjGameView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/10.
//

import SwiftUI

struct HiddenObjGameView: View {
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
                    .onTouch(type: .started, perform: updateLocation)
            }
            ObjectsHiddenView(foundTrash: $foundTrash)
            VStack {
                TopCollocate()
                Spacer()
                ObjectsToFindView(foundTrash: $foundTrash)
            }
            if foundTrash.count == 10 {
                Text("완료!") // 스테이지 클리어 이미지로 교체 예정
                    .onTapGesture {
                        isHiddenObjGameClear.toggle()
                    }
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    func updateLocation(_ location: CGPoint) {
        print(location)
    }
}

struct TopCollocate: View {
    var body: some View {
        HStack {
            PauseEncounter()
                .frame(width: 50, height: 50)
                .padding()
            HStack {
                Image(systemName: "circle")
                    .frame(width: 50, height: 30)
                    .padding()
                ExplainGameView()
            }
            .frame(width: 500, height: 30)
            .background(Color.white)
            Spacer()
        }.padding([.trailing, .leading], 44)
            .background(Image("game_woodenPanel"))
            .frame(height: 50)
    }
}

struct ExplainGameView: View {
    var body: some View {
        HStack {
            // text 받아오는 함수 위치
            Text("설명을 해줄게!")
        }
        .frame(width: 400, height: 30)
        .background(Image(systemName: "rectangle"))
    }
}

extension View {
    func onTouch(type: TouchLocatingView.TouchType = .all, limitToBounds: Bool = true, perform: @escaping (CGPoint) -> Void) -> some View {
        self.modifier(TouchLocater(type: type, limitToBounds: limitToBounds, perform: perform))
    }
}

struct HiddenObjGameView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenObjGameView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
