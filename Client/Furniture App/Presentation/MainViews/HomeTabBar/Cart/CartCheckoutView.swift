//
//  CartCheckoutView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 06/02/24.
//

import SwiftUI

struct CartCheckoutView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var showCheckoutBottomSheet: Bool
    
    @State var paymentMethod: PaymentMethod = .paytm
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Payment Method")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            RadioButtonView(checked: paymentMethod == .paytm, name: "Paytm UPI", image: "paytm") {
                paymentMethod = .paytm
            }
            
            RadioButtonView(checked: paymentMethod == .googlePay, name: "Google Pay UPI", image: "google-pay") {
                paymentMethod = .googlePay
            }
            
            RadioButtonView(checked: paymentMethod == .phonePe, name: "PhonePe UPI", image: "phonepe") {
                paymentMethod = .phonePe
            }
            
            Button {
                cartViewModel.checkOut {
                    homeViewModel.selectedTab = .home
                    showCheckoutBottomSheet = false
                }
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
        .padding(.horizontal)
    }
}

#Preview {
    CartCheckoutView(showCheckoutBottomSheet: .constant(false))
        .environmentObject(CartViewModel())
}
