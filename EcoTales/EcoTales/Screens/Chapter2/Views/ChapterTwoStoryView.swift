//
//  ChapterTwoStoryView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/12.
//

import SwiftUI

struct ChapterTwoStoryView: View {
    @State private var isGameClear = false
    @State private var storyIndex = 0
    @State private var isMoveView = false
    @State private var chapter = 2
    @State private var num = 0
    var body: some View {
        StoryView(chapter: self.$chapter, isGameClear: self.$isGameClear, num: self.$num)
    }
}

struct ChapterTwoStoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterTwoStoryView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
