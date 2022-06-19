//
//  ChapterUserSettingData.swift
//  EcoTales
//
//  Created by 임 용관 on 2022/06/20.
//

import Foundation

class ChapterThreeUserSettings: ObservableObject {
    @Published var circleScore = 0
    @Published var isShowCircle = Array(repeating: false, count: 5)
    @Published var lifeCount = 3
}
