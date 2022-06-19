//
//  EpilogueView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/19.
//

import SwiftUI

struct EpilogueTwo: View {
    @State private var epilogueNumber = 0
    @State private var epilogueIndex = 0
    @State private var isFinished = false
    @State private var chapter: Chapter = .four

    var body: some View {
        ZStack {
            Image(eplilogueBackground())
                .backgroundStyle()
            if epilogueNumber == 0 {
                VStack {
                    Spacer()
                    Text(StoryData().epilogueTwoSentence[epilogueIndex])
                        .font(.seoulHangangM.story)
                }
                .padding(.bottom, 30)
            } else if epilogueNumber == 1 {
                HStack {
                    VStack(alignment: .leading) {
                        Text(epilogueDialog(position: 0))
                            .font(.seoulHangangM.story)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.seoulHangangM.story)
                        }
                        .opacity(epilogueIndex.isMultiple(of: 3) ? 1 : 0)
                        Text(epilogueDialog(position: 1))
                            .font(.seoulHangangM.story)
                            .opacity(epilogueIndex % 3 >= 1 ? 1 : 0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.seoulHangangM.story)
                        }
                        .opacity(epilogueIndex % 3 == 1 ? 1 : 0)
                        Text(epilogueDialog(position: 2))
                            .font(.seoulHangangM.story)
                            .opacity(epilogueIndex % 3 == 2 ? 1 : 0)
                        HStack {
                            Spacer()
                            Text("다음")
                                .font(.seoulHangangM.story)
                        }
                        .opacity(epilogueIndex % 3 == 2 ? 1 : 0)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.45)
                    Spacer()
                }
            } else if isFinished == true {
                NavigationLink(isActive: $isFinished,
                               destination: { StoryView(chapter: $chapter) },
                               label: { Text("a") })
            }
        }
        .onTapGesture {
            if epilogueNumber == 0 {
                if epilogueIndex != StoryData().epilogueTwoSentence.count - 1 {
                    epilogueIndex += 1
                } else {
                    epilogueNumber += 1
                    epilogueIndex = 0
                }
            } else {
                if epilogueIndex != StoryData().epilogueTwoDialog.count - 1 {
                    epilogueIndex += 1
                } else {
                    epilogueNumber += 1
                    epilogueIndex = 0
                    isFinished = true
                }
            }
        }
        .navigationBarHidden(true)
    }

    private func eplilogueBackground() -> String {
        return epilogueNumber == 0 ? ImageLiteral.epilogueValley : ImageLiteral.intro1Background
    }

    private func epilogueDialog(position: Int) -> String {
        return StoryData().epilogueTwoDialog[epilogueIndex / 3 * 3 + position]
    }
}

struct EpilogueTwo_Previews: PreviewProvider {
    static var previews: some View {
        EpilogueTwo()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
