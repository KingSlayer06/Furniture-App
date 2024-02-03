//
//  TabBarView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State var selectedTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(tabs, id: \.id) { tab in
                    switch tab {
                    case .home:
                        HomeView()
                            .tag(tab)
                    case .search:
                        SearchView()
                            .tag(tab)
                    case .cart:
                        CartView()
                            .tag(tab)
                    case .profile:
                        ProfileView()
                            .tag(tab)
                    }
                }
            }
            
            bottomTabBar
        }
        .ignoresSafeArea(.all, edges: .vertical)
    }
}

extension TabBarView {
    
    var bottomTabBar: some View {
        HStack {
            ForEach(tabs, id: \.id) { tab in
                Spacer()
                
                Image(systemName: selectedTab == tab ? tab.selectedImage : tab.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(KeyVariables.primaryColor))
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            selectedTab = tab
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
        .padding(.bottom, 25)
        .padding(.top, 10)
    }
}

#Preview {
    TabBarView()
        .environmentObject(CartViewModel())
}
