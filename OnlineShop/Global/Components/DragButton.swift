//
//  DragButton.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/12/09.
//
//struct DragButton_Previews: PreviewProvider {
//    static var previews: some View {
//        DragButton()
//    }
//}

import SwiftUI

struct DragButton: View {
    @Binding var trigger: Bool
    var body: some View {
        HStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 50,height: 5)
                .foregroundColor(Color.palette.parent)
                .opacity(trigger ? 0.33: 1.0)
                .animation(.linear(duration: 0.33))
                .padding(.bottom,10)
        }
        .frame(width: UIScreen.main.bounds.width,height: 30,alignment: .bottom)
        .background(Color.palette.child)
    }
}

