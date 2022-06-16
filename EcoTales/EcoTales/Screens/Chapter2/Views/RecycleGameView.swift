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
                    // Mole and speech bubble
                    ZStack(alignment: .topLeading) {
                        Text("여기에 텍스트가 들어갑니다")
                            .multilineTextAlignment(.leading)
                            .frame(width: 180, height: 120)
                            .background(Ellipse().fill(Color.RecycleFillWhite))
                            .padding(.leading, 85)
                            .padding(.bottom, 200)
                        Image("character_mole")
                            .resizable()
                            .frame(width: 113, height: 86)
                            .padding(.top, 80)
                    }
                    Spacer()
                }

                // Conveyor belt and garbage
                VStack {
                    ZStack {
                        Image("conveyorBelt")
                            .resizable()
                            .frame(width: 300, height: 200, alignment: .top)
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
