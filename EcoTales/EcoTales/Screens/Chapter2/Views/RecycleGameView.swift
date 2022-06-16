//  RecycleGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/13.
//

import SwiftUI

struct RecycleGameView: View {
    @State var randomObject = [0,1,2,3,4,5,6,7,8,9,10,11].shuffled()
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
                        if !randomObject.isEmpty {
                            Image(RecycleObject(rawValue: randomObject[0])!.recycleObjectImage())
                                .resizable()
                                .frame(width: 120, height: 100, alignment: .top)
                        }
                    }
                    Spacer()
                }
                // Recycle Bins
                VStack {
                    Spacer()
                    RecycleBins(randomObject: $randomObject)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct RecycleBins: View {
    @Binding var randomObject: [Int]
    //    private var s재활용 = RecycleObject
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
                    Button {
                        if recycleBinArray[recycleIndex].recycleName() == RecycleObject(rawValue: randomObject[0])!.recycleObjectName() {
                            randomObject.remove(at: 0)
                            SoundManager.playSounds("boxingSound.wav")
                        }
                        else {
                            SoundManager.playSounds("SLIP.mp3")
                        }
                    } label: {
                        Image(recycleBinArray[recycleIndex].recycleImage())
                            .resizable()
                            .frame(width: 94, height: 121)
                    }
                    //                    Image(recycleBinArray[recycleIndex].recycleImage())
                    //                        .resizable()
                    //                        .frame(width: 94, height: 121)
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
