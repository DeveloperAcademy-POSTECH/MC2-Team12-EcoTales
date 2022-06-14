//
//  ChapterPopUpView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import SwiftUI

struct ChapterPopUpView: View {

    @EnvironmentObject var chapterProgress: ChapterProgress
    @Binding var isPop: Bool

    var chapter: Chapter

    private var popUpMessage: String {
        let isCompleted = chapterProgress.completionStatus[chapter] ?? false

        return isCompleted
        ? "chapter \(chapter.rawValue) 완료"
        : "chapter \(chapter.rawValue)미완"
    }

    var body: some View {
        if isPop {
            Button(popUpMessage) {
                chapterProgress.completionStatus[chapter] = true
                isPop = false
            }
        }
    }

}
