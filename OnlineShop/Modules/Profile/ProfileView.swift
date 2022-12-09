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
    @State private var myColorTheme: MyColorTheme = MyColorTheme()
    @State private var parentColor: Color = Color.palette.parent
    @State private var childColor: Color = Color.palette.child
    var body: some View {
        ZStack{
            colorThemeChanger
            
            VStack(spacing:0) {
                Text("Profile")
                .font(.title)
                .foregroundColor(Color.palette.child)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}

extension ProfileView{
    // color theme changer
    private var colorThemeChanger: some View{
        VStack(spacing:0) {
            HStack(spacing: 0) {
                // parent color picker
                ColorPicker(selection: $parentColor,supportsOpacity: true, label: {})
                    .onChange(of: parentColor) { newParentColor in
                        myColorTheme.saveColor(color: newParentColor, forKey: "parent_color")
                    }
                Spacer()
                Button(action: {myColorTheme.defaultColorTheme()}) {
                    Text("set to defaults")
                        .foregroundColor(Color.palette.child)
                }
                Spacer()
                // child color picker
                ColorPicker(selection: $childColor,supportsOpacity: true, label: {})
                    .onChange(of: childColor) { newChildColor in
                        myColorTheme.saveColor(color: newChildColor, forKey: "child_color")
                    }
            }
        .labelsHidden()
        .padding([.vertical,.horizontal])
            Spacer()
        }
        
    }
}
