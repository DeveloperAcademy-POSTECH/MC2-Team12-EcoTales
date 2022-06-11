//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {
            Image("map_background_Lia")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            Image("path1")
            Image("path2")
            Image("path3")
            Image("path4")

            Image("StageMark")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("1")
                }
                .position(x: 110, y: 270)

            Image("StageMark")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("22")
                }
                .position(x: 300, y: 320)
            Image("StageMark")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("333")
                }
                .position(x: 410, y: 210)
            Image("StageMark")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("4444")
                }
                .position(x: 550, y: 125)
            Image("StageMark")
                .frame(width: 50, height: 50)
                .onTapGesture {
                    print("55555")
                }
                .position(x: 720, y: 300)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
