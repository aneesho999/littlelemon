//
//  RegistrationPage.swift
//  littlelemon-iOS-capstone
//
//  Created by Aneesh Oak on 10/04/25.
//

let kFirstName = "first_name_key"
let kLastName = "last_name_key"
let kEmail = "email_key"
let kIsLoggedIn = "kIsLoggedIn"

import SwiftUI

// Define an enum for navigation destinations
enum NavigationDestination {
    case home
}

struct Onboarding: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var navigationPath = [NavigationDestination]()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 16) {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        if isValidEmail(email) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                            // Navigate to Home by appending to the navigation path
                            navigationPath.append(.home)
                        } else {
                            print("Invalid email address.")
                        }
                    } else {
                        print("Please fill all fields.")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .home:
                    Home()
                        .navigationBarBackButtonHidden(true)
                }
            }
            .onAppear {
                            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                                navigationPath.append(.home)
                            }
                        }
        }
    }

    // Basic email validation
    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}

#Preview {
    Onboarding()
}
