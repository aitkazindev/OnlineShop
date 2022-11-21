//
//  OnlineShopApp.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//

import SwiftUI
import FirebaseCore




@main
struct OnlineShopApp: App {
    //Register your app
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var shopVM: ShopViewModel = ShopViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnlineShopView()
                .environmentObject(shopVM)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
