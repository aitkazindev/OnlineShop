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
    var body: some View {
        ZStack{
            //products
            products.padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}

extension ShopView{
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
