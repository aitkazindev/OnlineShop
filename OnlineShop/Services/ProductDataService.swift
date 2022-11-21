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

    
    private let database = Firestore.firestore()
    
    private var productsID: CollectionReference {
        return database.collection("products_id")
    }
    
    private var products: CollectionReference{
        return database.collection("products")
    }
    // download product data from Firebase Firestore
    func downloadProductData(productID: String, completion: @escaping (Result<ProductModel, Error>)-> Void){
        products.document(productID).getDocument { docSnapshot, error in
            guard let docSnapshot = docSnapshot else{
                if let error = error{
                    completion(.failure(error))
                }
                return
            }
            guard let data = docSnapshot.data() else {return}
            guard let id: String = data["id"] as? String,
                let article: String = data["article"] as? String,
                let brandRawValue: String = data["brand"] as? String,
                let brand: Brands = Brands.init(rawValue: brandRawValue),
                let name: String = data["name"] as? String,
                let description: String = data["description"] as? String,
                let cost: Double = data["cost"] as? Double,
                  let imageFromAssets: String = data["imageFromAssets"] as? String else{
                return
            }
            
            let product: ProductModel = ProductModel(id: id,article: article, brand: brand, name: name, description: description, cost: cost, imageFromAssets: imageFromAssets)
            completion(.success(product))
        }
        
        
    }
    // download all products id
    func downloadProductsID(completion: @escaping(Result<[String],Error>)->Void){
        productsID.getDocuments { querySnapshot, error in
            guard let querySnapshot = querySnapshot else{
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            var productsID: [String] = []
            let documents = querySnapshot.documents
            for document in documents{
                productsID.append(document.documentID)
            }
            completion(.success(productsID))
        }
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
