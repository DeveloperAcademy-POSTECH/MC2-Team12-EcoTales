//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    @State var isComplishedCH1 = false
    @State var isComplishedCH2 = false
    @State var isComplishedCH3 = false
    @State var isComplishedCH4 = false
    @State var isComplishedCH5 = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("map_background_Lia")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                Image("path1")
                    .isHidden(!isComplishedCH1)
                Image("path2")
                    .isHidden(!isComplishedCH2)
                Image("path3")
                    .isHidden(!isComplishedCH3)
                Image("path4")
                    .isHidden(!isComplishedCH4)

                NavigationLink(destination: ChapterView(isComplished: self.$isComplishedCH1)) {
                    Image(isComplishedCH1 ? "StageMark" : "StageMarkGray")
                        .frame(width: 50, height: 50)
                }
                .position(x: 110, y: 270)

                NavigationLink(destination: ChapterView(isComplished: self.$isComplishedCH2)) {
                    Image(isComplishedCH2 ? "StageMark" : "StageMarkGray")
                        .frame(width: 50, height: 50)
                }
                .position(x: 300, y: 320)
                .disabled(!isComplishedCH1)

                NavigationLink(destination: ChapterView(isComplished: self.$isComplishedCH3)) {
                    Image(isComplishedCH3 ? "StageMark" : "StageMarkGray")
                        .frame(width: 50, height: 50)
                }
                .position(x: 410, y: 210)
                .disabled(!isComplishedCH2)

                NavigationLink(destination: ChapterView(isComplished: self.$isComplishedCH4)) {
                    Image(isComplishedCH4 ? "StageMark" : "StageMarkGray")
                        .frame(width: 50, height: 50)
                }
                .position(x: 550, y: 125)
                .disabled(!isComplishedCH3)

                NavigationLink(destination: ChapterView(isComplished: self.$isComplishedCH5)) {
                    Image(isComplishedCH5 ? "StageMark" : "StageMarkGray")
                        .frame(width: 50, height: 50)
                }
                .position(x: 720, y: 300)
                .disabled(!isComplishedCH4)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct ChapterView: View {
    @Binding var isComplished: Bool
    var body: some View {
        Button(isComplished ? "완료 상태👍🏻" : "미완료 상태😅") {
            isComplished.toggle()
        }
    }
}

extension View {
    func isHidden(_ toggle: Bool) -> some View {
        if toggle {
            return AnyView(self.hidden())
        }
        return AnyView(self)
    }
}
