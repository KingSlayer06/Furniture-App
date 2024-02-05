//
//  ProfileView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Text("Profile")
                .font(.title.bold())
                
            Image("profile-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .padding(.vertical)
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.headline.bold())
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                    .background(Color(KeyVariables.primaryColor))
                    .cornerRadius(12)
            }
            
            VStack(spacing: 20) {
                Color(KeyVariables.primaryColor)
                    .opacity(0.5)
                    .frame(height: 1)
                
                ProfileMenu(image: "gearshape", title: "Settings") {
                    
                }
                
                ProfileMenu(image: "archivebox", title: "My Orders") {
                    
                }
                
                ProfileMenu(image: "location", title: "Address") {
                    
                }
                
                ProfileMenu(image: "lock", title: "Change Password") {
                    
                }
                
                Color(KeyVariables.primaryColor)
                    .opacity(0.5)
                    .frame(height: 1)
                
                ProfileMenu(image: "questionmark.circle", title: "Help & Support") {
                    
                }
                
                ProfileMenu(image: "gearshape", title: "Logout") {
                    
                }
            }
            .padding()
        }
    }
}

struct ProfileMenu: View {
    var image: String
    var title: String
    var onClick: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: image)
            
            Text(title)
                .font(.title3)
            
            Spacer()
            
            Image(systemName: "chevron.right")
        }
        .onTapGesture {
            onClick()
        }
    }
}

#Preview {
    ProfileView()
}
