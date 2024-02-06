//
//  RadioButtonView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 06/02/24.
//

import SwiftUI
struct RadioButtonView: View {
    var checked: Bool
    var name: String
    var image: String
    var onClick: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.horizontal)
            
            Text(name)
                .font(.title2)
            
            Spacer()
            
            if self.checked {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background {
            if self.checked {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color(KeyVariables.primaryColor), lineWidth: 2)
            }
        }
        .onTapGesture {
            self.onClick()
        }
    }
}

#Preview {
    RadioButtonView(checked: true, name: "Paytm UPI", image: "paytm", onClick: {})
}
