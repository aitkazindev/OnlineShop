//
//  ProductDetailView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/18.
//
//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView()
//    }
//}
import SwiftUI

struct ProductDetailView: View {
    let product: ProductModel
    @Environment(\.presentationMode) private var mode
    @EnvironmentObject private var shopVM: ShopViewModel
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 0) {
                //product images
                productImages
                VStack(alignment: .leading,spacing: 5) {
                    
                    HStack(spacing: 10) {
                        //product article
                        productArticle
                        Spacer()
                        //upload product data
                        deleteProduct
                        uploadProduct
                    }
                    
                    //product Brand
                    productBrand
                    //product Name
                    productName
                    //product Description
                    productDescription
                    //product Cost
                    productCost
                }
                .padding([.horizontal,.vertical])
                Spacer()
                
            }
            //close Button
            closeButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}

extension ProductDetailView{
    // product images
    @ViewBuilder var productImages: some View{
        if let _ = product.images.first{
            TabView{
                ForEach(product.images, id: \.self){
                    image in
                    Image(uiImage: image)
                }
            }
            .tabViewStyle(.page)
            .frame(height: 300)
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
    // product description
    private var productDescription: some View{
        Text(product.description)
            .font(.subheadline)
        
            .foregroundColor(Color.palette.child)
        
    }
    // product cost
    private var productCost: some View{
        Text("\(product.cost.toDecimalPlaces() )$")
            .font(.callout)
            .foregroundColor(Color.palette.child)
        
    }
    
    
    
    //close button
    private var closeButton: some View{
        VStack(spacing: 0){
            Spacer()
            Button(action: {
                mode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.compact.down")
                    .foregroundColor(Color.palette.child)
            }
        }
        .padding(.bottom)
    }
}
extension ProductDetailView{
    //upload product
    private var uploadProduct:some View {
        Button(action: {
            //upload product data
            shopVM.uploadProduct(product: product)
            
        }) {
            Image(systemName: "arrow.up")
                .foregroundColor(Color.palette.child)
        }
    }
    // MARK:  delete product 
    //delete product
    private var deleteProduct:some View {
        Button(action: {
            //delete product data
            shopVM.deleteProduct(product: product)
            
        }) {
            Image(systemName: "trash")
                .foregroundColor(Color.palette.child)
        }
    }
}
