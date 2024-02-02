//
//  TabBarView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab: Tab = .home
    
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
                            .environmentObject(CartViewModel())
                            .tag(tab)
                    case .profile:
                        ProfileView()
                            .tag(tab)
                    }
                }
            }
            
            bottomTabBar
        }
        .ignoresSafeArea(.all, edges: .top)
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
                    .foregroundColor(Color("kPrimary"))
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            selectedTab = tab
                        }
                    }
                
                Spacer()
            }
        }
    }
}

#Preview {
    TabBarView()
}
