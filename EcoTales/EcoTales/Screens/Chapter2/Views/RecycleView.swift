//
//  RecycleView.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/14.
//

// 이미지쓰레기가 쓰레기통버튼과 맞는지 확인해서
// 쓰레기 맞으면 다음 쓰레기로 넘기기

import SwiftUI

struct RecycleView: View {
    //쓰레기가 쓰레기통과 일치하는지 확인하는 함수
//    func CheckGarbage(garbage: Int, recyclingBin: Int) {
//
//    }
    @State var rightGarbage = false

    var body: some View {
        VStack {
            Image("recycle_plasticBag")
                .resizable()
                .frame(width: 100, height: 100)
            HStack {
                Button(action: {}) {
                    Image("recyclingBin_plastic")
                        .resizable()
                        .frame(width: 100, height: 150)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {}) {
                    Image("recyclingBin_vinyl")
                        .resizable()
                        .frame(width: 100, height: 150)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {}) {
                    Image("recyclingBin_can")
                        .resizable()
                        .frame(width: 100, height: 150)
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecycleView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
