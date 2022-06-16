//
//  View+isHidden.swift
//  EcoTales
//
//  Created by 리아 on 2022/06/13.
//

import SwiftUI

extension View {
    func showToggle(_ toggle: Bool) -> some View {
        if toggle {
            return AnyView(self)
        }
        return AnyView(self.hidden())
    }
}
