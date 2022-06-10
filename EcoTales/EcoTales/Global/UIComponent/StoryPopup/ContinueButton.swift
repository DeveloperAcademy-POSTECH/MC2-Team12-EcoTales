//
//  ContinueButton.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//

import SwiftUI

struct ContinueButton: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.PopupContinueGreen)
                .frame(width: 180, height: 55)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
            HStack(spacing: 20){
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.title)
                    .foregroundColor(.PopupWhite)
                Text("계속하기")
                    .fontWeight(.bold)
                    .foregroundColor(Color.PopupWhite)
                    .font(.system(size: 24, weight: .heavy))
            }
        }
    }
}

struct ContinueButton_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton()
    }
}
