//
//  SoundTestView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/13.
//

import SwiftUI



struct SoundTestView: View {
    var body: some View {
        Text("SoundTest")
        Button(action: {
            playSound(sound: "jumpin", type: "mp3")
        }) {
            Image(systemName: "arrowtriangle.right.circle.fill").resizable()
                .frame(width: 50, height: 50)
                .buttonStyle(PlainButtonStyle())
        }
    }
}

struct SoundTestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SoundTestView()
        }
    }
}
