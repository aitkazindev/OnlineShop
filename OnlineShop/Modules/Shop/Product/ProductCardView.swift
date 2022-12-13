//
//  ProductCardView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/18.
//
//struct ProductCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCardView()
//    }
//}
import SwiftUI

struct ProductCardView: View {
    let product: ProductModel
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            //product image
            productImage
            VStack(alignment: .leading,spacing: 5) {
                // product article
                productArticle
                // product brand
                productBrand
                //product name
                productName
                productCost
            }
            
        }
        
        
    }
}

extension ProductCardView{
    // product images
    @ViewBuilder private var productImage: some View{
        if let image = product.mainImage {
            Image(uiImage: image)
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: Settings.shared.productCardSize, height: Settings.shared.productCardSize)
        }
    }
    
    // product article
    private var productArticle: some View{
        Text(product.article)
            .font(.caption)
            .bold()
            .foregroundColor(Color.palette.parent)
            .padding(.horizontal,5)
            .background(Color.palette.child.cornerRadius(5))
    }
    
    // product brand
    private var productBrand: some View{
        Text(product.brand.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(Color.palette.parent)
            .padding(.horizontal,5)
            .background(Color.palette.child.cornerRadius(5))
    }
    
    // product name
    private var productName: some View{
        Text(product.name)
            .font(.headline)
            .foregroundColor(Color.palette.child)
            
    }
    // product cost
    private var productCost: some View{
        Text("\(product.cost.toDecimalPlaces() )$")
            .font(.callout)
            .foregroundColor(Color.palette.child)
            
    }
}

