//
//  ShopView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//
//struct ShopView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopView()
//    }
//}
import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack{
            Text("Home")
                .font(.title)
                .foregroundColor(Color.palette.child)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}


