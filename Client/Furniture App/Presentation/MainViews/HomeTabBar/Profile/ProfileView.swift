//
//  ProfileView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: true) {
                Text("Profile")
                    .font(.title.bold())
                    
                Image("profile-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .padding(.vertical)
                
                NavigationLink {
                    Text("Edit Profile")
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
                    
                    NavigationLink {
                        Text("Settings")
                    } label: {
                        ProfileMenu(image: "gearshape", title: "Settings")
                    }
                    
                    NavigationLink {
                        Text("My Orders")
                    } label: {
                        ProfileMenu(image: "archivebox", title: "My Orders")
                    }
                    
                    NavigationLink {
                        Text("Address")
                    } label: {
                        ProfileMenu(image: "location", title: "Address")
                    }
                    
                    NavigationLink {
                        Text("Change Password")
                    } label: {
                        ProfileMenu(image: "lock", title: "Change Password")
                    }
                    
                    Color(KeyVariables.primaryColor)
                        .opacity(0.5)
                        .frame(height: 1)
                    
                    NavigationLink {
                        Text("Help & Support")
                    } label: {
                        ProfileMenu(image: "questionmark.circle", title: "Help & Support")
                    }
                    
                    ProfileMenu(image: "gearshape", title: "Logout")
                        .onTapGesture {
                            
                        }
                }
                .padding()
            }
        }
    }
}

struct ProfileMenu: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: image)
                .foregroundColor(Color(KeyVariables.themeColor))
            
            Text(title)
                .font(.title3)
                .foregroundColor(Color(KeyVariables.themeColor))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color(KeyVariables.themeColor))
        }
    }
}

#Preview {
    ProfileView()
}
