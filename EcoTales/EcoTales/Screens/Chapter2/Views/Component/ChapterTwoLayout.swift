//  ChapterTwoLayout.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/13.
//

import SwiftUI

struct ChapterTwoLayout: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Top Wooden Panel
                ZStack {
                    HStack {
                        ZStack {
                            Image("game_woodenPanel")
                                .scaledToFit()
                            HStack {
                                // todo: 현재 레이아웃으로 넣긴 했으나, 눌렀을 때 팝업이 뜨는 기능이 필요
                                PauseEncounter()
                                    .frame(width: 20, height: 20)
                                Spacer()
                                Image("hintBook")
                                    .resizable()
                                    .frame(width: 57, height: 57)
                            }
                            .padding(.horizontal, 44)
                        }
                    }
                }

                // Background and Conveyor belt item
                ZStack {
                    Image("chapter2_background")
                        .resizable()
                        .ignoresSafeArea()
                    VStack {
                        Image("conveyorBelt")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 300, height: 200, alignment: .top)
                        Spacer()
                    }
                    VStack {
                        // todo: need to bring list of garbage
                        Image("hidden_snack")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 120, height: 100, alignment: .top)
                            .padding(.top)
                        Spacer()
                    }
                }
            }

            HStack {
                ZStack {
                    HStack {
                        Image("character_mole")
                            .resizable()
                            .frame(width: 113, height: 86)
                        Spacer()
                    }
                    HStack {
                        VStack {
                            Text("여기에 텍스트가 들어갑니다")
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(width: 150, height: 100)
                                .background(Ellipse().fill(Color.RecycleFillWhite))
                        }
                        .padding(.bottom, 80)
                        Spacer()
                    }
                    .padding(.leading, 90)
                }
            }
            .padding(.leading, 44)

            // Recycle Bins
            VStack {
                Spacer()
                RecycleBins()
            }
        }
        .ignoresSafeArea()
    }
}

struct RecycleBins: View {
    var body: some View {

        let recyleBins = ["recycleBin_litter", "recycleBin_vinyl",
                          "recycleBin_can", "recycleBin_plastic",
                          "recycleBin_paper", "recycleBin_glass"]
        let recycleBinsText = ["일반쓰레기", "비닐", "캔", "플라스틱", "종이", "유리"]

        HStack {
            ForEach(0..<recyleBins.count) { recycleIndex in
                if recycleIndex == 0 {
                    VStack {
                        Text(recycleBinsText[recycleIndex])
                        Image(recyleBins[recycleIndex])
                            .resizable()
                            .frame(width: 94, height: 121)
                    }
                    Spacer()
                } else if recycleIndex == recyleBins.count - 1 {
                    Spacer()
                    VStack {
                        Text(recycleBinsText[recycleIndex])
                            .ignoresSafeArea()
                        Image(recyleBins[recycleIndex])
                            .resizable()
                            .frame(width: 94, height: 121)
                    }
                } else {
                    Spacer()
                    VStack {
                        Text(recycleBinsText[recycleIndex])
                            .ignoresSafeArea()
                        Image(recyleBins[recycleIndex])
                            .resizable()
                            .frame(width: 94, height: 121)
                    }
                    Spacer()
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 44)
    }
}

struct ChapterTwoLayout_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTwoLayout()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
