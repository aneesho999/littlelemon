//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Aneesh Oak on 27/02/25.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject var menu: LLMenu = LLMenu()
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 3)
    
    var body: some View {
        NavigationView {
            VStack (alignment: HorizontalAlignment.leading) {
                HStack {
                    Spacer()
                    Text("Menu")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                    Spacer()
                    NavigationLink(destination: MenuItemOptionView(menu: menu)) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
        
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        switch menu.foodFilter {
                        case .none:
                            SectionView(title: "Food", items: menu.foodMenu)
                            SectionView(title: "Desserts", items: menu.dessertMenu)
                            SectionView(title: "Drinks", items: menu.drinkMenu)
                        case .food:
                            SectionView(title: "Food", items: menu.foodMenu)
                        case .desserts:
                            SectionView(title: "Desserts", items: menu.dessertMenu)
                        case .drinks:
                            SectionView(title: "Drinks", items: menu.drinkMenu)
                        }
                    }
                }
                        
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct SectionView: View {
    var title: String
    var items: [MenuItem]
    let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 3)

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .padding(.leading)
                .padding(.top, 10)

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(items, id: \.name) { item in
                    MenuItemView(item: item)
                }
            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    MenuItemsView()
}
