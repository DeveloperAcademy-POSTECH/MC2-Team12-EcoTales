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
    func CheckGarbage(garbage: Int, recyclingBin: Int) {

    }
    @State var rightGarbage = false
    @State var random: String = ""
    var body: some View {
        VStack {
            Image(random)
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
                // random 버튼
                Button(action: {
                    self.random = chooseRandomImage()
                }) {
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

//var images = [
//    "recycle_cokeCan",
//    "recycle_glassCup",
//    "recycle_mugCup",
//    "recycle_straw",
//    "recycle_plasticBag",
//    "recycle_snack",
//    "recycle_water",
//    "recycle_paperBox",
//    "recycle_glassBottle",
//    "recycle_drinkCan",
//    "recycle_newspaper"]

var images = [
    "recycle_cokeCan",
    "recycle_glassCup",
    "recycle_straw"]

func chooseRandomImage() -> String {
    let array = images
    let result = array.randomElement()!
    return result
}

struct RecycleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecycleView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
