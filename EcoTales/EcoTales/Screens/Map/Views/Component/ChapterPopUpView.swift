//
//  ChapterPopUpView.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import SwiftUI

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
