//
//  ExitButton.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//

import SwiftUI

struct ExitButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.PopupExitRed)
                .frame(width: 180, height: 55)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
            HStack(spacing: 27) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .rotationEffect(.degrees(90))
                    .frame(width: 25, height: 24)
                    .font(.system(size: 5, weight: .semibold))
                    .foregroundColor(.PopupWhite)
                Text("나가기")
                    .fontWeight(.bold)
                    .foregroundColor(Color.PopupWhite)
                    .font(.system(size: 24, weight: .heavy))
            }
        }
    }
}

struct ExitButton_Previews: PreviewProvider {
    static var previews: some View {
        ExitButton()
    }
}
