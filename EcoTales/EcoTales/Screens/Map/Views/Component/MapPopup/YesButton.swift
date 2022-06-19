//
//  YesButton.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/11.
//

import SwiftUI

struct YesButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.PopupContinueGreen)
                .frame(width: 120, height: 55)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
            HStack(spacing: 27) {
                Text("네")
                    .fontWeight(.bold)
                    .foregroundColor(Color.PopupWhite)
                    .font(.system(size: 24, weight: .heavy))
            }
        }
    }
}

struct YesButton_Previews: PreviewProvider {
    static var previews: some View {
        YesButton()
    }
}
