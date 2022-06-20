//
//  LaunchScreenView.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/16.
//

import SwiftUI

struct SplashView: View {
    @Binding var isSplash: Bool

    var body: some View {
        ZStack {
            BackgroundImage("launchScreen_background")
            Text("에코 테일즈")
                .font(.mapleFont.title)
                .foregroundColor(Color.PopupReplayYellow)
            VStack {
                Spacer()
                Text("세계수와 나")
                    .font(.mapleFont.subtitle)
                    .foregroundColor(Color.PopupStrokeBrown)
                    .shadow(color: .white, radius: 10, x: 0, y: 0)
                Text("화면을 눌러서 시작하기")
                    .padding(.top, 1)
                    .font(.mapleFont.startButton)
                    .foregroundColor(Color.PopupFillBrown)
                    .shadow(color: .black, radius: 10, x: 0, y: 0)
            }
            .padding(.bottom, 60)
        }
        .ignoresSafeArea()
        .onTapGesture {
            isSplash = false
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isSplash: .constant(true))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
