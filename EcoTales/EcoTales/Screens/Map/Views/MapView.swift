//
//  MapView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/10.
//

import SwiftUI

struct MapView: View {
    @StateObject var chapterViewModel = ChapterViewModel()
    @State var isPopUp = false
    @State var selectedChapter = Chapter.one

    var body: some View {
        NavigationView {
            ZStack {
                Image("map_background_Lia")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                ZStack {
                    Image("path1")
                        .isHidden(!chapterViewModel.isCompleted(chapter: .one))
                    Image("path2")
                        .isHidden(!chapterViewModel.isCompleted(chapter: .two))
                    Image("path3")
                        .isHidden(!chapterViewModel.isCompleted(chapter: .three))
                    Image("path4")
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

                Image("Child")
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

struct ChapterView: View {

    var chapter: Chapter
    @Binding var chapterViewModel: ChapterViewModel
    @Binding var isPop: Bool

    var body: some View {
        if isPop {
            Button(chapterViewModel.getPopUpMessage(chapter: chapter)) {
                chapterViewModel.complete(chapter: chapter)
                isPop = false
            }
        }
    }
}

extension View {
    func isHidden(_ toggle: Bool) -> some View {
        if toggle {
            return AnyView(self.hidden())
        }
        return AnyView(self)
    }
}

enum Chapter: Int, CaseIterable {
    case one = 1, two, three, four, five
}

extension Chapter: Identifiable {
    var id: RawValue { rawValue }
}

class ChapterViewModel: ObservableObject {

    @Published var chapterCompletion: [Chapter: Bool]

    init() {
        chapterCompletion = Chapter.allCases.reduce(into: [Chapter: Bool]()) {
            $0[$1] = false
        }
    }

    func complete(chapter: Chapter) {
        chapterCompletion[chapter] = true
    }

    func isCompleted(chapter: Chapter) -> Bool {
        return chapterCompletion[chapter]!
    }

    func getPopUpMessage(chapter: Chapter) -> String {
        return isCompleted(chapter: chapter) ? "chapter \(chapter.rawValue) 완료" : "chapter \(chapter.rawValue)미완"
    }

    func isDisabled(chapter: Chapter) -> Bool {
        if chapter == .one { return false }
        return !isCompleted(chapter: Chapter(rawValue: chapter.rawValue - 1) ?? .five
        )
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
        let isCompleted = (chapterCompletion[chapter] ?? false)
        return isCompleted ? "StageMark" : "StageMarkGray"
    }

    private func getLastChapter() -> Chapter {
        let completedChapters = chapterCompletion
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
