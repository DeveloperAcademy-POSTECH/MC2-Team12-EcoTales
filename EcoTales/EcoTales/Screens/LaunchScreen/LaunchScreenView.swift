//
//  LaunchScreenView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/09.
//

import SwiftUI

struct LaunchScreenView: View {
    @Binding var isSplash: Bool
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            VStack {
                Text("에코 테일즈")
                    .foregroundColor(Color.yellow)
                    .font(.custom("Kyobo Handwriting 2019", size: 100))
                    .bold()
                    .shadow(color: Color.brown, radius: 1, x: 5, y: 5)
                Text("터치해서 시작하기")
            }
        }
        .onTapGesture {
            isSplash = false
        }
    }
}
