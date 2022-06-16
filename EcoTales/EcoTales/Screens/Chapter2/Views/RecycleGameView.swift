//  RecycleGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/13.
//

import SwiftUI

struct RecycleGameView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Top Wooden Panel
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

            // Background
            ZStack {
                Image("chapter2_background")
                    .resizable()
                    .ignoresSafeArea()
                HStack {
                    // Mole
                    ZStack(alignment: .leading) {
                        Image("character_mole")
                            .resizable()
                            .frame(width: 113, height: 86)
                            .padding(.bottom, 100)
                        Spacer()
                            .padding(.bottom, 100)
                        Text("여기에 텍스트가 들어갑니다")
                            .multilineTextAlignment(.leading)
                            .frame(width: 180, height: 120)
                            .background(Ellipse().fill(Color.RecycleFillWhite))
                            .padding(.leading, 85)
                            .padding(.bottom, 200)
                    }
                }

                // Conveyor belt and garbage
                VStack {
                    ZStack {
                        Image("conveyorBelt")
                            .resizable()
                            .frame(width: 300, height: 200, alignment: .top)
                        // todo: need to bring list of garbage
                        Image("hidden_snack")
                            .resizable()
                            .frame(width: 120, height: 100, alignment: .top)
                    }
                    Spacer()
                }

                // Recycle Bins
                VStack {
                    Spacer()
                    RecycleBins()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct RecycleBins: View {
    var body: some View {

        let recycleBinArray: [RecycleBinTypes] = [.recycleBinLitter, .recycleBinVinyl,
                                                  .recycleBinCan, .recycleBinPlastic,
                                                  .recycleBinPaper, .recycleBinGlass]

        HStack {
            ForEach(0..<recycleBinArray.count) { recycleIndex in
                Spacer()
                VStack {
                    Text(recycleBinArray[recycleIndex].recycleName())
                        .ignoresSafeArea()
                    Image(recycleBinArray[recycleIndex].recycleImage())
                        .resizable()
                        .frame(width: 94, height: 121)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct RecycleGameView_Previews: PreviewProvider {
    static var previews: some View {
        RecycleGameView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
