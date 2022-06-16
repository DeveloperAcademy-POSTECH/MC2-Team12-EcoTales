//
//  RecycleObject.swift
//  EcoTales
//
//  Created by YejiMac on 2022/06/16.
//

enum RecycleObject {
    case litter
    case egg
    case bag
    case snack
    case coke
    case drink
    case straw
    case water
    case box
    case newspaper
    case cup
    case bottle
    
    func recycleObjectImage() -> String {
        switch self {
        case .litter:
            return ImageLiteral.litter
        case .egg:
            return ImageLiteral.egg
        case .bag:
            return ImageLiteral.bag
        case .snack:
            return ImageLiteral.snack
        case .coke:
            return ImageLiteral.coke
        case .drink:
            return ImageLiteral.drink
        case .straw:
            return ImageLiteral.straw
        case .water:
            return ImageLiteral.water
        case .box:
            return ImageLiteral.box
        case .newspaper:
            return ImageLiteral.newspaper
        case .cup:
            return ImageLiteral.cup
        case .bottle:
            return ImageLiteral.bottle
        }
    }
}
