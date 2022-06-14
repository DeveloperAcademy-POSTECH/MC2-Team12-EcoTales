//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var chapterProgress: ChapterProgress
    @StateObject var chapterViewModel = ChapterViewModel()
    @State var isPopUp = false
    @State var selectedChapter = Chapter.one

    var body: some View {
        NavigationView {
            ZStack {
                Image(ImageLiteral.mapBackground)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                ZStack {
                    Image(ImageLiteral.path1to2)
                        .isHidden(!chapterViewModel.isCompleted(chapter: .one))
                    Image(ImageLiteral.path2to3)
                        .isHidden(!chapterViewModel.isCompleted(chapter: .two))
                    Image(ImageLiteral.path3to4)
                        .isHidden(!chapterViewModel.isCompleted(chapter: .three))
                    Image(ImageLiteral.path4to5)
                        .isHidden(!chapterViewModel.isCompleted(chapter: .four))
                }

                ForEach(Chapter.allCases) { chapter in
                    Button {
                        isPopUp.toggle()
                        selectedChapter = chapter
                    } label: {
                        Image(chapterViewModel.getStageImage(chapter: chapter))
                            .frame(width: 50, height: 50)
                    }
                    .position(chapterViewModel.getStagePosition(chapter: chapter))
                    .disabled(chapterViewModel.isDisabled(chapter: chapter))
                }

                Image(ImageLiteral.child)
                    .position(chapterViewModel.getChildPosition())

                ChapterView(chapter: selectedChapter,
                            chapterViewModel: Binding<ChapterViewModel>.constant(chapterViewModel),
                            isPop: $isPopUp)

            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}


class ChapterViewModel: ObservableObject {

    @EnvironmentObject var chapterProgress: ChapterProgress

    func complete(chapter: Chapter) {
        chapterProgress.completionStatus[chapter] = true
    }

    func isCompleted(chapter: Chapter) -> Bool {
        return chapterProgress.completionStatus[chapter]!
    }

    func getPopUpMessage(chapter: Chapter) -> String {
        return isCompleted(chapter: chapter) ? "chapter \(chapter.rawValue) 완료" : "chapter \(chapter.rawValue)미완"
    }

    func isDisabled(chapter: Chapter) -> Bool {
        if chapter == .one { return false }
        return !(isCompleted(chapter: Chapter(rawValue: chapter.rawValue - 1) ?? .five))
    }

    func getStagePosition(chapter: Chapter) -> CGPoint {
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

    func getStageImage(chapter: Chapter) -> String {
        let isCompleted = (chapterProgress.completionStatus[chapter] ?? false)
        return isCompleted ? ImageLiteral.activeStageMark : ImageLiteral.inactiveStageMark
    }

    private func getLastChapter() -> Chapter {
        let completedChapters = chapterProgress.completionStatus
            .filter { !$0.value }
            .sorted(by: { $0.key.rawValue < $1.key.rawValue })
        return completedChapters.isEmpty ? Chapter.one : completedChapters[0].key
    }

    func getChildPosition() -> CGPoint {
        let chapter = getLastChapter()
        let position = getStagePosition(chapter: chapter)
        return CGPoint(x: position.x, y: position.y - 50)
    }

}
