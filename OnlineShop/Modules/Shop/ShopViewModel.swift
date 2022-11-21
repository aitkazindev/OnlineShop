//
//  ShopViewModel.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/18.
//

import Foundation

class ShopViewModel: ObservableObject{
    private let productDataService = ProductDataService.shared
    private let productImageServices = ProductImageService.shared
    @Published var products: [ProductModel] = []
    
    init(){
        //getLocalProducts()
        getProducts()
    }
    
    // get products from firebase
    
    func getProducts(){
        productDataService.downloadProductsID { result in
            switch result{
                
            case .success(let productsID):
                for productID in productsID {
                    self.getProduct(productID: productID)
                }
            case .failure(_):
                print("error") // TODO: complete
            }
        }
    }
    
    // get product
    
    func getProduct(productID: String){
        productDataService.downloadProductData(productID: productID) { result in
            switch result {
                
            case .success(let product):
                self.productImageServices.downloadProductImage(product: product) { result in
                    switch result{
                        
                    case .success(let image):
                        let product: ProductModel = ProductModel(product: product, productImage: image)
                        self.products.append(product)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    // upload product
    func uploadProduct(product: ProductModel){
        productImageServices.uploadProductImage(product: product) { result in
            switch result{
                
            case .success(_):
                self.productDataService.uploadProductData(product: product) { result in
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
        productDataService.deleteProductData(product: product) { result in
            switch result {
                
            case .success(let product):
                self.productImageServices.deleteProductImages(product: product)
            case .failure(_):
                break
            }
        }
    }

    private func getLocalProducts(){
        let product1 = ProductModel(article: "000001", brand: .brand1, name: "Product 1", description: "product 11", cost: 10, imageFromAssets: "1")
        let product2 = ProductModel(article: "000002", brand: .brand1, name: "Product 2", description: "product 12", cost: 10, imageFromAssets: "2")
        let product3 = ProductModel(article: "000003", brand: .brand1, name: "Product 3", description: "product 13", cost: 10, imageFromAssets: "3")
        let product4 = ProductModel(article: "000004", brand: .brand1, name: "Product 4", description: "product 14", cost: 10, imageFromAssets: "4")
        let product5 = ProductModel(article: "000005", brand: .brand1, name: "Product 5", description: "product 15", cost: 10, imageFromAssets: "5")
        let product6 = ProductModel(article: "000006", brand: .brand1, name: "Product 6", description: "product 16", cost: 10, imageFromAssets: "6")
        let product7 = ProductModel(article: "000007", brand: .brand1, name: "Product 7", description: "product 17", cost: 10, imageFromAssets: "7")
        let product8 = ProductModel(article: "000008", brand: .brand1, name: "Product 8", description: "product 18", cost: 10, imageFromAssets: "8")
        let product9 = ProductModel(article: "000009", brand: .brand1, name: "Product 9", description: "product 19", cost: 10, imageFromAssets: "9")
        let product10 = ProductModel(article: "0000010", brand: .brand1, name: "Product 10", description: "product 10", cost: 10, imageFromAssets: "10")
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
