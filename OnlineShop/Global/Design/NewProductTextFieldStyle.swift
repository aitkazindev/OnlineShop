//
//  NewProductTextFieldStyle.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/12/12.
//

import SwiftUI

struct NewProductTextFieldStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16,weight: .medium,design: .rounded))
            .foregroundColor(Color.palette.parent.opacity(0.88))
            .padding(5)
            .background(Color.white.cornerRadius(5))
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                        Color.palette.child,
                        lineWidth: 1.0
                    )
            }
    }
}

extension View{
    func newProductTextFieldStyle() -> some View{
        return modifier(NewProductTextFieldStyle())
    }
}
