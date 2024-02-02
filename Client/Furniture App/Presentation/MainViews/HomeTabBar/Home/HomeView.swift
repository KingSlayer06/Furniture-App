//
//  HomeView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCrousel = 0
    @State private var carouselTimer: Timer?
    @State private var searchText: String = ""
    
    var carouselAnimationSpeed: Float = 3.5
    
    let width = UIScreen.main.bounds.width
    let carouselHeight: CGFloat = 300
    
    var body: some View {
        VStack {
            searchView
            carouselView
            Spacer()
        }
    }
}

extension HomeView {
    
    var carouselView: some View {
        TabView(selection: $selectedCrousel) {
            ForEach(carouselList.indices, id: \.self) { index in
                Image(carouselList[index].image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: carouselHeight)
                    .clipShape(Rectangle())
            }
        }
        .frame(height: carouselHeight)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.default, value: selectedCrousel)
        .transition(.slide)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    DynamicCarouselDotsView(
                        currentPage: $selectedCrousel,
                        numberOfPages: carouselList.count,
                        currentPageIndicatorTintColor: UIColor(named: "kPrimary") ?? .white,
                        pageIndicatorTintColor: UIColor(named: "kSecondary") ?? .white.withAlphaComponent(0.6))
                    .offset(x: -6,y: 3)
                    .frame(width: 50, height: 1)
                }
                .padding()
            }
            .padding(.bottom, 4)
        }
        .onAppear {
            var secondsRemaining = carouselAnimationSpeed
            carouselTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                if secondsRemaining > 0 {
                    secondsRemaining -= 0.1
                } else {
                    secondsRemaining = carouselAnimationSpeed
                    
                    if selectedCrousel < carouselList.count {
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
                    .padding(.leading)
                
                TextField("Search For Furniture", text: $searchText)
                    .padding()
            }
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
