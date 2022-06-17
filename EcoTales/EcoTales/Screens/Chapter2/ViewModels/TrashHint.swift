//
//  TrashHint.swift
//  EcoTales
//
//  Created by Eunbee Kang on 2022/06/17.
//

import Foundation

struct TrashHint {
    var trashType: String
    var image: String
    var description: String
}

struct TrashHintData {
    var list = [
        TrashHint(trashType: "플라스틱", image: "", description: ""),
        TrashHint(trashType: "종이", image: "", description: ""),
        TrashHint(trashType: "유리", image: "", description: ""),
        TrashHint(trashType: "캔", image: "", description: ""),
        TrashHint(trashType: "비닐", image: "", description: ""),
        TrashHint(trashType: "일반쓰레기", image: "", description: "")
    ]
}
