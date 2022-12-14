//
//  ShopModel.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/18.
//

import Foundation
import SwiftUI
enum Brands: String, CaseIterable{
    case brand1 = "Brand 1"
    case brand2 = "Brand 2"
    case brand3 = "Brand 3"
    case brand4 = "Brand 4"
    case brand5 = "Brand 5"
}
struct ProductModel: Identifiable{
    let id: String
    let article: String
    let brand: Brands
    let name: String
    let description: String
    let cost: Double
    let images: [UIImage]
    let mainImage:UIImage?
    
    
    init(id: String = UUID().uuidString, article: String, brand: Brands, name: String, description: String, cost: Double, images: [UIImage] = [],mainImage:UIImage? = nil) {
        self.id = id
        self.article = article
        self.brand = brand
        self.name = name
        self.description = description
        self.cost = cost
        self.images = images
        self.mainImage = mainImage
    }
    
    init(product: ProductModel, productImage: UIImage){
        self.init(id: product.id,article: product.article, brand: product.brand, name: product.name, description: product.description, cost: product.cost)
    }
    
    var data: [String: Any]{
        var data: [String: Any] = [:]
        data["id"] = id
        data["article"] = article
        data["brand"] = brand.rawValue
        data["name"] = name
        data["description"] = description
        data["cost"] = cost
        return data
    }
    
}
// brand picker
// product article
// product name
// product cost
// product images
// product description

struct NewProduct{
    var brand: String = ""
    var article: String = ""
    var name: String = ""
    var cost: String = ""
    var description: String = ""
    var images: [UIImage] = []
    var mainImage: UIImage? = nil
}
