//
//  ContentView.swift
//  OnlineShop
//
//  Created by Ibrahim_ios on 2022/11/16.
//
struct OnlineShopView_Previews: PreviewProvider {
    static var previews: some View {
        OnlineShopView()
    }
}
import SwiftUI
enum TabItems: String, CaseIterable{
    case home = "house.fill"
    case shop = "list.bullet"
    case cart = "cart.fill"
    case profile = "person.fill"
}
struct OnlineShopView: View {
    @Namespace private var tabBarNameSpace
    @State private var selectedTab: TabItems = .home
    var body: some View {
        ZStack{
            VStack(spacing:0){
                //show pages
                pages
                Spacer(minLength: 10)
                //tab bar
                tabBar
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.palette.parent.ignoresSafeArea())
    }
}
extension OnlineShopView{
    //pages
    @ViewBuilder private var pages: some View {
        switch selectedTab{
        case .home:
            HomeView()
        case .cart:
            CartView()
        case .profile:
            ProfileView()
        case .shop:
            ShopView()
        }
    }
    
    //tab bar
    
    private var tabBar: some View{
        HStack(spacing: 0) {
            ForEach(TabItems.allCases, id: \.self){ tabItem  in
                ZStack{
                    if selectedTab == tabItem{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.palette.child)
                            .matchedGeometryEffect(id: "tabs", in: tabBarNameSpace)
                            .frame(width: UIScreen.main.bounds.width/6)
                    }
                    Image(systemName: tabItem.rawValue)
                        .foregroundColor(selectedTab == tabItem ? Color.palette.parent : Color.palette.child)

                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                    .onTapGesture {
                        withAnimation(.linear){
                            selectedTab = tabItem
                        }
                    }


            }
        }.frame(maxWidth: UIScreen.main.bounds.width,maxHeight: 40)
    }
    
}


