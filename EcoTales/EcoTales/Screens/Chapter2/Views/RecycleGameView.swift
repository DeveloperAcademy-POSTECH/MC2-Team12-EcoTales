//  RecycleGameView.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/13.
//

import SwiftUI

struct RecycleGameView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var randomObject = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].shuffled()
    @State private var isWrong = false
    @State private var isGameOver = false
    @Binding var isGameClear: Bool

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Top Wooden Panel
                ZStack {
                    Image(ImageLiteral.woodenPanel)
                        .scaledToFit()
                    HStack {
                        PauseEncounter()
                            .frame(width: 20, height: 20)
                        TimerView(isWrong: $isWrong, isGameOver: $isGameOver)
                        Image("hintBook")
                            .resizable()
                            .frame(width: 57, height: 57)
                    }
                    .padding(.horizontal, 44)
                }
                // Background
                ZStack {
                    Image(ImageLiteral.chapter2PollutedBackground)
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
                            Image(ImageLiteral.mole)
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
                                let recycleObjectZero = RecycleObject(rawValue: randomObject[0]) ?? .egg
                                Image(recycleObjectZero.recycleObjectImage())
                                    .resizable()
                                    .frame(width: 120, height: 100, alignment: .top)
                            }
                        }
                        Spacer()
                    }
                    // Recycle Bins
                    VStack {
                        Spacer()
                        RecycleBins(randomObject: $randomObject, isWrong: $isWrong, isGameClear: $isGameClear)
                    }
                }
            }
            if isGameClear {
                Color.black
                    .opacity(0.4)
                    .ignoresSafeArea()
                Text("Game Clear!")
                    .foregroundColor(Color.white)
                    .font(.title)
            }
            if isGameOver {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                Text("Game Over!")
                    .foregroundColor(Color.white)
                    .font(.title)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            if isGameClear {
                presentationMode.wrappedValue.dismiss()
                chapterProgress.completionStatus[.two] = true
            }
        }
    }
}

struct RecycleBins: View {
    @Binding var randomObject: [Int]
    @Binding var isWrong: Bool
    @Binding var isGameClear: Bool
    var body: some View {
        let recycleBinArray: [RecycleBinTypes] = [.recycleBinLitter, .recycleBinVinyl,
                                                  .recycleBinCan, .recycleBinPlastic,
                                                  .recycleBinPaper, .recycleBinGlass]
        HStack {
            ForEach(0..<recycleBinArray.count) { recycleIndex in
                Spacer()
                VStack {
                    Text(recycleBinArray[recycleIndex].recycleName())
                    Button {
                        if !randomObject.isEmpty {
                            let recycleObjectZero = RecycleObject(rawValue: randomObject[0]) ?? .egg
                            if recycleBinArray[recycleIndex].recycleName() ==
                                recycleObjectZero.recycleObjectType() {
                                randomObject.remove(at: 0)
                                SoundManager.playSounds("boxingSound.wav")}
                            else {
                                isWrong = true
                                SoundManager.playSounds("SLIP.mp3")
                            }
                            if randomObject.isEmpty {
                                isGameClear = true
                            }
                        }
                    } label: {
                        Image(recycleBinArray[recycleIndex].recycleImage())
                            .resizable()
                            .frame(width: 94, height: 121)
                    }
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
