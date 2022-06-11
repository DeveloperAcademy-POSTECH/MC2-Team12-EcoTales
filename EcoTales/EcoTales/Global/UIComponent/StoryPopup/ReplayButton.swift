//
//  ReplayButton.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct ReplayButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.PopupReplayYellow)
                .frame(width: 180, height: 55)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
            HStack(spacing: 14) {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 27, height: 26)
                    .font(.system(size: 5, weight: .semibold))
                    .foregroundColor(.PopupWhite)
                Text("다시 시작")
                    .fontWeight(.bold)
                    .foregroundColor(Color.PopupWhite)
                    .font(.system(size: 24, weight: .heavy))
            }
        }
    }
}

struct ReplayButton_Previews: PreviewProvider {
    static var previews: some View {
        ReplayButton()
    }
}
