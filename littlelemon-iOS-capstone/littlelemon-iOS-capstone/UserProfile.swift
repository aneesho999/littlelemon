//
//  UserProfile.swift
//  littlelemon-iOS-capstone
//
//  Created by Aneesh Oak on 10/04/25.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName: String = UserDefaults.standard.string(forKey: "first_name_key") ?? ""
    
    let lastName: String = UserDefaults.standard.string(forKey: "last_name_key") ?? ""
    
    let email: String = UserDefaults.standard.string(forKey: "email_key") ?? ""
    
    var body: some View {
        VStack {
            Text("Personal Information")
            
            Image("profile-image-placeholder")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(firstName)
            Text(lastName)
            Text(email)
            
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
    }
}

#Preview {
    UserProfile()
}
