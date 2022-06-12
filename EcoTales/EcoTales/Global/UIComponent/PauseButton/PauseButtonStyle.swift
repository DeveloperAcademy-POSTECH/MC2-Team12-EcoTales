//
//  PauseButtonStyle.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

struct PauseButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                // PauseFillBrown background color on release, PauseStrokeBrown on press.
                    .fill(!configuration.isPressed ? Color.PauseFillBrown : Color.PauseStrokeBrown)
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.PauseStrokeBrown, lineWidth: 2)
            }
            .frame(width: 38, height: 38)
            Image(systemName: "pause.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 16)
                .font(.title)
                .foregroundColor(.PauseSymbolBrown) // SFSymbol color change
        }
    }
}
