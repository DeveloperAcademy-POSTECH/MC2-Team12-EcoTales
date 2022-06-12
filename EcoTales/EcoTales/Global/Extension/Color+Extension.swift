//
//  Color+Extension.swift
//  EcoTales
//
//  Created by Seik Oh on 2022/06/09.
//
import SwiftUI

// 사용방법: Color.VariableNameOfColor
extension Color {
    // Pause Button Colors
    static var PauseFillBrown: Color {
        return Color(hex: "#E2C372")
    }
    static var PauseSymbolBrown: Color {
        return Color(hex: "#87572B")
    }
    static var PauseStrokeBrown: Color {
        return Color(hex: "#856547")
    }
    // Popup Colors
    static var PopupFillBrown: Color {
        return Color(hex: "#FFF7DA")
    }
    static var PopupStrokeBrown: Color {
        return Color(hex: "#976638")
    }
    static var PopupContinueGreen: Color {
        return Color(hex: "#2F8410")
    }
    static var PopupReplayYellow: Color {
        return Color(hex: "#F9B532")
    }
    static var PopupExitRed: Color {
        return Color(hex: "#D95C3C")
    }
    static var PopupWhite: Color {
        return Color(hex: "#FAFAFA")
    }
}

extension Color {
    init(hex: String) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0)
    }
}
