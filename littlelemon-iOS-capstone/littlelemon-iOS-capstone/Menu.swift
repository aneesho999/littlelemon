//
//  Menu.swift
//  littlelemon-iOS-capstone
//
//  Created by Aneesh Oak on 10/04/25.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .bold()

                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.secondary)

                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)

                    List {
                        // Menu items will go here later
                    }
                }
                .padding()
    }
}

#Preview {
    Menu()
}
