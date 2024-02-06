//
//  TabBarView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI
import SwiftData

struct TabBarView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @Environment(\.modelContext) private var modelContext
    @Query private var cartItems: [ProductModel]
    
    @State var showCheckoutBottomSheet = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $homeViewModel.selectedTab) {
                    ForEach(tabs, id: \.id) { tab in
                        switch tab {
                        case .home:
                            HomeView()
                                .tag(tab)
                        case .search:
                            AllFurnituresView()
                                .tag(tab)
                        case .cart:
                            CartView(showCheckoutBottomSheet: $showCheckoutBottomSheet)
                                .tag(tab)
                        case .profile:
                            ProfileView()
                                .tag(tab)
                        }
                    }
                }
                
                bottomTabBar
            }
            .navigationDestination(isPresented: $cartViewModel.isOrderPlaced) {
                OrderPlacedView()
            }
        }
        .ignoresSafeArea(.all, edges: .vertical)
        .sheet(isPresented: $showCheckoutBottomSheet) {
            CartCheckoutView(showCheckoutBottomSheet: $showCheckoutBottomSheet)
            .presentationDetents([.medium])
            .presentationDragIndicator(.visible)
        }
        .onAppear {
            cartViewModel.syncCart(cartItems: cartItems)
            cartViewModel.modelContext = modelContext
            
            homeViewModel.fetchProducts()
        }
    }
}

extension TabBarView {
    
    var bottomTabBar: some View {
        HStack {
            ForEach(tabs, id: \.id) { tab in
                Spacer()
                
                Image(systemName: homeViewModel.selectedTab == tab ? tab.selectedImage : tab.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(KeyVariables.primaryColor))
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            homeViewModel.selectedTab = tab
                        }
                    }
                    .overlay {
                        if tab == .cart && cartViewModel.products.count > 0 {
                            Text("\(cartViewModel.products.count)")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .frame(width: 15, height: 15)
                                .background(.red)
                                .cornerRadius(50)
                                .offset(CGSize(width: 10.0, height: -10.0))
                        }
                    }
                
                Spacer()
            }
        }
        .padding(.bottom, 35)
        .padding(.top, 10)
    }
}

#Preview {
    TabBarView()
        .environmentObject(HomeViewModel())
        .environmentObject(CartViewModel())
}
