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
    @EnvironmentObject var shopVM: ShopViewModel
    @State private var selectedProduct: ProductModel? = nil
    @State private var showUploadNewProductView:Bool = false
    @State private var trigger:Bool = false
    var body: some View {
        ZStack{
            //upload new product
            uploadNewProducut
            VStack(spacing: 0) {
                //addmin bar
                adminBar
                //products
                products.padding(.vertical)
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}

extension ShopView{
    //upload new product
    @ViewBuilder private var uploadNewProducut: some View{
        if showUploadNewProductView{
            UploadNewProductView(showUploadNewProductView: $showUploadNewProductView)
                .transition(.move(edge: .top))
                .animation(.linear(duration: 0.88))
                .zIndex(1)
        }
    }
    //addmin bar
    private var adminBar: some View{
        DragButton(trigger: $trigger)
            .gesture(DragGesture()
                .onChanged({ dragValue in
                    trigger = true
                })
                .onEnded({ dragValue in
                    trigger = false
                    if dragValue.translation.height > 55{
                        showUploadNewProductView.toggle()
                    }
                })
            )
    }
    
    @ViewBuilder private var products: some View{
        let columns: [GridItem] = [GridItem(.fixed(Settings.shared.productCardSize),spacing: 15,alignment: nil),
                                   GridItem(.fixed(Settings.shared.productCardSize),spacing: 15,alignment: nil)]
        ScrollView(.vertical,showsIndicators: false) {
            LazyVGrid(columns: columns,alignment: .center, spacing: 15,pinnedViews: []) {
                ForEach(shopVM.products){ product in
                    ProductCardView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
                .sheet(item: $selectedProduct) { product in
                    ProductDetailView(product: product)
                }
            }
        }
    }
}
