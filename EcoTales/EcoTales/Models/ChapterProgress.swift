//
//  ChapterProgress.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import SwiftUI

class ChapterProgress: ObservableObject {
    @Published var completionStatus: [Chapter: Bool]

    init() {
        completionStatus = Chapter.allCases.reduce(into: [Chapter: Bool]()) {
            $0[$1] = false
        }
    }

}
