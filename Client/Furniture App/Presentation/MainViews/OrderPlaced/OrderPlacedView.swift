//
//  OrderPlacedView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 06/02/24.
//

import SwiftUI

struct OrderPlacedView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "cube.box.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(Color(KeyVariables.primaryColor))
                .padding(.vertical, 50)
            
            Text("Your Order Has Been Placed\nSuccessfully")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            
            Text("Your order has been successfully completed.\nWithin moments you will receive a notification with the receipt of your purchase and track\nevery step of your order.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.vertical, 20)
            
            Rectangle()
                .fill(.clear)
                .frame(height: 150)
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal)
        .edgesIgnoringSafeArea(.all)
        .overlay(alignment: .bottom) {
            continueButton
                .padding(.horizontal)
                .padding(.bottom, 35)
        }
        .onDisappear {
            cartViewModel.isOrderPlaced = false
        }
    }
}

extension OrderPlacedView {
    var continueButton: some View {
        Button {
            dismiss()
            cartViewModel.isOrderPlaced = false
        } label: {
            Text("Continue")
                .font(.headline.bold())
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.vertical, 20)
                .foregroundColor(.white)
                .background(Color(KeyVariables.primaryColor))
                .cornerRadius(12)
                .padding(.top)
        }
    }
}

#Preview {
    OrderPlacedView()
        .environmentObject(CartViewModel(modelContext: nil))
}
