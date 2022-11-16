//
//  ProfileView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Text("Profile")
                .font(.title)
                .foregroundColor(Color.palette.child)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}


