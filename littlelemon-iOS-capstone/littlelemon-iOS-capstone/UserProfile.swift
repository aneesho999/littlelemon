//
//  UserProfile.swift
//  littlelemon-iOS-capstone
//
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName: String = UserDefaults.standard.string(forKey: "first_name_key") ?? "first"
    
    let lastName: String = UserDefaults.standard.string(forKey: "last_name_key") ?? "last"
    
    let email: String = UserDefaults.standard.string(forKey: "email_key") ?? "email"
    
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .font(.custom("MarkaziText-Regular", size: 20))
        
                .fontWeight(.bold)
                .foregroundColor(primaryYellow)
            
            HStack {
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("Name: \(firstName) \(lastName)")
                    Text("Email: \(email)")
                }
                .foregroundColor(primaryYellow)
                .padding(.horizontal)
            }
            
            Button("Logout") {
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                
                self.presentation.wrappedValue.dismiss()
                
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(primaryGreen)
    }
}

#Preview {
    UserProfile()
}
