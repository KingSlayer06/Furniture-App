//
//  HomeView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @State private var selectedCrousel = 0
    @State private var carouselTimer: Timer?
    @State private var searchText: String = ""
    
    var carouselAnimationSpeed: Float = 3.5
    
    let width = UIScreen.main.bounds.width
    let carouselHeight: CGFloat = 200
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                header
                searchView
                carouselView
                
                HStack {
                    Text("New Arrivals")
                        .font(.title2)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Image(systemName: "circle.grid.2x2.fill")
                        .foregroundColor(Color(KeyVariables.primaryColor))
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(homeViewModel.products, id: \.id) { product in
                            NavigationLink {
                                ProductDetailsView(product: product)
                            } label: {
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
            }
        }
    }
}

extension HomeView {
    
    var carouselView: some View {
        TabView(selection: $selectedCrousel) {
            ForEach(homeViewModel.banners.indices, id: \.self) { index in
                NavigationLink {
                    ProductDetailsView(product: homeViewModel.banners[index])
                } label: {
                    Image(homeViewModel.banners[index].image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: carouselHeight)
                        .clipShape(Rectangle())
                }
            }
        }
        .frame(height: carouselHeight)
        .cornerRadius(12)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.default, value: selectedCrousel)
        .transition(.slide)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    DynamicCarouselDotsView(
                        currentPage: $selectedCrousel,
                        numberOfPages: homeViewModel.banners.count,
                        currentPageIndicatorTintColor: UIColor(named: KeyVariables.primaryColor) ?? .white,
                        pageIndicatorTintColor: UIColor(named: KeyVariables.secondaryColor) ?? .white.withAlphaComponent(0.6))
                    .offset(x: -6,y: 3)
                    .frame(width: 50, height: 1)
                }
                .padding()
            }
            .padding(.bottom, 4)
        }
        .padding()
        .onAppear {
            var secondsRemaining = carouselAnimationSpeed
            carouselTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if secondsRemaining > 0 {
                    secondsRemaining -= 0.1
                } else {
                    secondsRemaining = carouselAnimationSpeed
                    
                    if selectedCrousel < homeViewModel.banners.count {
                        selectedCrousel += 1
                    } else {
                        selectedCrousel = 0
                    }
                }
            }
        }
        .onDisappear {
            carouselTimer?.invalidate()
        }
    }
    
    var searchView: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black).bold()
                    .padding(.leading)
                
                TextField("", text: $searchText, prompt: Text("Search For Furniture").foregroundColor(.black).bold())
                    .foregroundColor(Color(KeyVariables.primaryColor))
                    .padding()
            }
            .background(Color(KeyVariables.secondaryColor))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color(KeyVariables.primaryColor))
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
    
    var header: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location.north.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
                Text("Mumbai, India")
                    .font(.title2)
                
                Spacer()
            }
            
            Text("Find The Most \nLuxurious")
                .font(.largeTitle.bold())
            
            + Text(" Furniture")
                .font(.largeTitle.bold())
                .foregroundColor(Color(KeyVariables.primaryColor))
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
