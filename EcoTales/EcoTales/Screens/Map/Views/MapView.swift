//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @State var isPopUp = false
    @State var selectedChapter = Chapter.one

    var body: some View {
        NavigationView {
            ZStack {
                Image(ImageLiteral.mapBackground)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                Group {
                    Image(ImageLiteral.path1to2)
                        .isShown(isCompleted(chapter: .one))
                    Image(ImageLiteral.path2to3)
                        .isShown(isCompleted(chapter: .two))
                    Image(ImageLiteral.path3to4)
                        .isShown(isCompleted(chapter: .three))
                    Image(ImageLiteral.path4to5)
                        .isShown(isCompleted(chapter: .four))
                }

                ForEach(Chapter.allCases) { chapter in
                    Button {
                        isPopUp.toggle()
                        selectedChapter = chapter
                    } label: {
                        Image(getStageImage(chapter: chapter))
                            .frame(width: 50, height: 50)
                    }
                    .position(getStagePosition(chapter: chapter))
                    .disabled(isStageDisabled(chapter: chapter))
                }

                Image(ImageLiteral.child)
                    .position(getChildPosition())

                ChapterPopUpView(isPop: $isPopUp, chapter: selectedChapter)
            }
        }
    }

    private func isCompleted(chapter: Chapter) -> Bool {
        return chapterProgress.completionStatus[chapter]!
    }

    private func isStageDisabled(chapter: Chapter) -> Bool {
        if chapter == .one { return false }
        let previousChapter = Chapter(rawValue: chapter.rawValue - 1)!
        let previousCompletion = chapterProgress.completionStatus[previousChapter]!
        return !previousCompletion
    }

    private func getStagePosition(chapter: Chapter) -> CGPoint {
        switch chapter {
        case .one:
            return CGPoint(x: 110, y: 270)
        case .two:
            return CGPoint(x: 300, y: 320)
        case .three:
            return CGPoint(x: 410, y: 210)
        case .four:
            return CGPoint(x: 550, y: 125)
        case .five:
            return CGPoint(x: 720, y: 300)
        }
    }

    private func getStageImage(chapter: Chapter) -> String {
        let isCompleted = (chapterProgress.completionStatus[chapter] ?? false)
        return isCompleted ? ImageLiteral.activeStageMark : ImageLiteral.inactiveStageMark
    }

    private func getChildPosition() -> CGPoint {
        let completedChapters = chapterProgress.completionStatus
            .filter { !$0.value }
            .sorted(by: { $0.key.rawValue < $1.key.rawValue })
        let lastChapter = completedChapters.isEmpty ? Chapter.one : completedChapters[0].key
        let position = getStagePosition(chapter: lastChapter)
        return CGPoint(x: position.x, y: position.y - 50)
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(ChapterProgress())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
