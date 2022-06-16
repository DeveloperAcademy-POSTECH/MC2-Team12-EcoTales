//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @State var isPopUp: Bool = false
    @State var selectedChapter: Chapter = Chapter.zero

    var body: some View {
        ZStack {
            BackgroundImage(ImageLiteral.mapBackground)

            Group {
                Image(ImageLiteral.path1to2)
                    .showToggle(isCompleted(chapter: .zero))
                Image(ImageLiteral.path2to3)
                    .showToggle(isCompleted(chapter: .one))
                Image(ImageLiteral.path3to4)
                    .showToggle(isCompleted(chapter: .two))
                Image(ImageLiteral.path4to5)
                    .showToggle(isCompleted(chapter: .three))
            }

            Group {
                ForEach(Chapter.allCases) { chapter in
                    Button {
                        isPopUp.toggle()
                        selectedChapter = chapter
                    } label: {
                        Image(stageImage(chapter: chapter))
                            .frame(width: 50, height: 50)
                    }
                    .position(stagePosition(chapter: chapter))
                    .disabled(isStageDisabled(chapter: chapter))
                }
            }

            Image(ImageLiteral.child)
                .position(childPosition())

            MapPopup(iscount: $isPopUp, chapter: selectedChapter)
        }

    }

    private func isCompleted(chapter: Chapter) -> Bool {
        return chapterProgress.completionStatus[chapter] ?? false
    }

    private func isStageDisabled(chapter: Chapter) -> Bool {
        guard chapter != .zero else { return false }
        let previousChapter = Chapter(rawValue: chapter.rawValue - 1) ?? .zero
        let previousCompletion = chapterProgress.completionStatus[previousChapter]!
        return !previousCompletion
    }

    private func stagePosition(chapter: Chapter) -> CGPoint {
        switch chapter {
        case .zero:
            return CGPoint(x: 110, y: 270)
        case .one:
            return CGPoint(x: 300, y: 320)
        case .two:
            return CGPoint(x: 410, y: 210)
        case .three:
            return CGPoint(x: 550, y: 125)
        case .four:
            return CGPoint(x: 720, y: 300)
        }
    }

    private func stageImage(chapter: Chapter) -> String {
        let isCompleted = (chapterProgress.completionStatus[chapter] ?? false)
        return isCompleted ? ImageLiteral.activeStageMark : ImageLiteral.inactiveStageMark
    }

    private func childPosition() -> CGPoint {
        let completedChapters = chapterProgress.completionStatus
            .filter { $0.value }

        if completedChapters.count != Chapter.allCases.count {
            let uncompletedChapters = chapterProgress.completionStatus
                .filter { !$0.value }
                .sorted(by: { $0.key.rawValue < $1.key.rawValue })
            let lastChapter = uncompletedChapters.isEmpty ? Chapter.zero : uncompletedChapters[0].key
            let position = stagePosition(chapter: lastChapter)
            return CGPoint(x: position.x, y: position.y - 50)
        } else {
            let position = stagePosition(chapter: selectedChapter)
            return CGPoint(x: position.x, y: position.y - 50)
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(ChapterProgress())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
