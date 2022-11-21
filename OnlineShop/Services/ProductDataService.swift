//
//  ProductDataService.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/21.
//

import Foundation
import FirebaseFirestore

class ProductDataService {
    
    static let shared: ProductDataService = ProductDataService()
    
    init() {
        //
    }
    
    private let database = Firestore.firestore()
    
    private var productsID: CollectionReference {
        return database.collection("products_id")
    }
    
    private var products: CollectionReference{
        return database.collection("products")
    }
    
    // upload product data
    func uploadProductData(product: ProductModel, completion: @escaping (Result<ProductModel, Error>) -> Void){
        products.document(product.id).setData(product.data) { error in
            if let error = error{
                completion(.failure(error))
            }else{
                self.productsID.document(product.id).setData([:]){ error in
                    if let error = error{
                        completion(.failure(error))
                    }else{
                        completion(.success(product))
                    }
                }
            }
        }
    }
    
    // delete product from database
    
    func deleteProductData(product:ProductModel,completion: @escaping (Result<ProductModel, Error>)-> Void){
        productsID.document(product.id).delete { error in
            if let error = error{
                completion(.failure(error))
            }else{
                self.products.document(product.id).delete { error in
                    if let error = error {
                        completion(.failure(error))
                    }else{
                        completion(.success(product))
                    }
                }
            }
        }
    }
}
