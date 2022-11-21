//
//  ColorTheme.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//

import Foundation
import SwiftUI
extension Color{
    static let palette: Palette = Palette()
}

struct Palette {
    let child: Color = Color("child")
    let parent: Color = Color("parent")
}

extension Double{
    func toDecimalPlaces() -> String{
        return String(format: "%.2f", self)
    }
}
