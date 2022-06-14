//
//  Chapter.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import Foundation

enum Chapter: Int, CaseIterable {
    case one = 1, two, three, four, five

     func name() -> String {
        switch self {
        case .one:
            return "인트로"
        case .two:
            return "챕터 1"
        case .three:
            return "챕터 2"
        case .four:
            return "챕터 3"
        case .five:
            return "에필로그"
        }
    }
}

extension Chapter: Identifiable {
    var id: RawValue { rawValue }
}
