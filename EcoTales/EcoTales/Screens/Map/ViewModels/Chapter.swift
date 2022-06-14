//
//  Chapter.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/14.
//

import Foundation

enum Chapter: Int, CaseIterable {
    case one = 1, two, three, four, five
}

extension Chapter: Identifiable {
    var id: RawValue { rawValue }
}
