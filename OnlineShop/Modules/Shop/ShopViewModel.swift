//
//  ShopViewModel.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/18.
//

import Foundation

class ShopViewModel: ObservableObject{
    private let dataService = ProductDataService.shared
    private let imageService = ProductImageService.shared
    @Published var products: [ProductModel] = []
    
    init(){
        getProducts()
    }
    
    // upload product
    func uploadProduct(product: ProductModel){
        imageService.uploadProductImage(product: product) { result in
            switch result{
                
            case .success(_):
                self.dataService.uploadProductData(product: product) { result in
                    switch result{
                        
                    case .success(let product):
                        print("Successfully uploaded product: \(product.id)")
                    case .failure(let error):
                        print("Error uploading product: \(product.id) : \(error.localizedDescription)")
                        // delete product
                        
                    }
                }
            case .failure(let error):
                print("Error uploading product: \(product.id) : \(error.localizedDescription)")
                break
            }
        }
    }
    
    // delete product
    
    func deleteProduct(product: ProductModel){
        dataService.deleteProductData(product: product) { result in
            switch result {
                
            case .success(let product):
                self.imageService.deleteProductImages(product: product)
            case .failure(let error):
                break
            }
        }
    }

    private func getProducts(){
        let product1 = ProductModel(article: "000001", brand: .brand1, name: "Product 1", description: "product 11", cost: 10, image: "1")
        let product2 = ProductModel(article: "000002", brand: .brand1, name: "Product 2", description: "product 12", cost: 10, image: "2")
        let product3 = ProductModel(article: "000003", brand: .brand1, name: "Product 3", description: "product 13", cost: 10, image: "3")
        let product4 = ProductModel(article: "000004", brand: .brand1, name: "Product 4", description: "product 14", cost: 10, image: "4")
        let product5 = ProductModel(article: "000005", brand: .brand1, name: "Product 5", description: "product 15", cost: 10, image: "5")
        let product6 = ProductModel(article: "000006", brand: .brand1, name: "Product 6", description: "product 16", cost: 10, image: "6")
        let product7 = ProductModel(article: "000007", brand: .brand1, name: "Product 7", description: "product 17", cost: 10, image: "7")
        let product8 = ProductModel(article: "000008", brand: .brand1, name: "Product 8", description: "product 18", cost: 10, image: "8")
        let product9 = ProductModel(article: "000009", brand: .brand1, name: "Product 9", description: "product 19", cost: 10, image: "9")
        let product10 = ProductModel(article: "0000010", brand: .brand1, name: "Product 10", description: "product 10", cost: 10, image: "10")
        products.append(contentsOf: [
            product1,
            product2,
            product3,
            product4,
            product5,
            product6,
            product7,
            product8,
            product9,
            product10
        ])
    }
}
