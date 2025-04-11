//
//  RegistrationPage.swift
//  littlelemon-iOS-capstone
//

let kFirstName = "first_name_key"
let kLastName = "last_name_key"
let kEmail = "email_key"
let kIsLoggedIn = "kIsLoggedIn"

let primaryGreen = Color.init(red: 73 / 255.0, green: 94 / 255.0, blue: 87 / 255.0)
let primaryYellow = Color.init(red: 244 / 255.0, green: 206 / 255.0, blue: 20 / 255.0)

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
    
    @State private var showAllFieldFill: Bool = false
    @State private var showInvalidEmail: Bool = false
    
    var button: some View {
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
                    showInvalidEmail = true
                }
            } else {
                showAllFieldFill = true
            }
        }
        .padding()
        .background(primaryYellow)
        .foregroundColor(.black)
        .cornerRadius(8)
        .alert("Error!", isPresented: $showAllFieldFill) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please fill All fields.")
        }
        .alert("Error!", isPresented: $showInvalidEmail) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Invalid Email Address.")
        }
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 16) {
                Image("Little Lemon logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(45)
                
                Text("Little Lemon")
                    .foregroundColor(primaryYellow)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                
                
                
                TextInput(label: "First Name", textVariable: $firstName)
                
                TextInput(label: "Last Name", textVariable: $lastName, icon: nil)
                    
                    TextInput(label: "Email", textVariable: $email, icon: nil)

                button
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(primaryGreen)
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(primaryGreen)
    }

    // Basic email validation
    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}

