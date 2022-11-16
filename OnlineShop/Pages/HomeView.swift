//
//  HomeView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Text("Home")
                    .font(.title)
                    .foregroundColor(Color.palette.child)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}


