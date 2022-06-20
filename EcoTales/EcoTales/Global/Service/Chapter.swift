//
//  Chapter.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import Foundation

enum Chapter: Int, CaseIterable {
    case zero = 0, one, two, three, four, epilogue

     func name() -> String {
        switch self {
        case .zero:
            return "인트로"
        case .one:
            return "챕터 1"
        case .two:
            return "챕터 2"
        case .three:
            return "챕터 3"
        case .four:
            return "챕터 4"
        case .epilogue:
            return "에필로그"
        }
    }
}

extension Chapter: Identifiable {
    var id: RawValue { rawValue }
}
