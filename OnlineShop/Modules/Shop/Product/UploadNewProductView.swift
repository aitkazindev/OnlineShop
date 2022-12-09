//
//  UploadNewProductView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/12/09.
//
//struct UploadNewProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadNewProductView()
//    }
//}
import SwiftUI

struct UploadNewProductView: View {
    @Binding  var showUploadNewProductView: Bool
    @State private var trigger:Bool = false
    var body: some View {
        ZStack{
            Text("New Product")
                .foregroundColor(Color.palette.child)
            VStack(spacing: 0) {
                Spacer()
                dragButton
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}

extension UploadNewProductView{
    //drag button
    private var dragButton: some View{
        VStack(spacing: 0) {
            Spacer()
            DragButton(trigger: $trigger)
                .gesture(DragGesture()
                    .onChanged({ dragValue in
                        trigger = true
                        
                    })
                        .onEnded({ dragValue in
                            trigger = false
                            if dragValue.translation.height < -55 {
                                showUploadNewProductView.toggle()
                            }
                            
                        })
                )
        }
        
    }
}

