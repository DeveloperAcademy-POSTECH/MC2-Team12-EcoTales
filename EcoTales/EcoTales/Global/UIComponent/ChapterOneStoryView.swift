//
//  ChapterOneStoryView.swift
//  EcoTales
//
//  Created by 김민택 on 2022/06/11.
//

import SwiftUI

struct ChapterOneStoryView: View {
    @State private var isGameClear = false
    @State private var storyIndex = 0
    @State private var isMoveView = false
    @State private var chapter = 1
    @State private var num = 0
    var body: some View {
        StoryView(chapter: self.$chapter, num: self.$num)
    }
}

struct ChapterOneStoryView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterOneStoryView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
