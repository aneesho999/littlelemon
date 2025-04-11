//
//  Menu.swift
//  littlelemon-iOS-capstone
//
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var hasFetchedData = false
    
    @State private var searchText: String = ""
    
    @State private var mainDishes: Bool = true
    @State private var starterDishes: Bool = true
    @State private var dessertsDishes: Bool = true
    @State private var sidesDishes: Bool = true
    
    var header: some View {
        HStack(alignment: .center) {
            Spacer()
            Image("Logo")
            Spacer()
        }
    }
        
    var heroSection: some View {
        VStack() {
            HStack() {
                VStack(alignment: .leading) {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(primaryYellow)
                        
                    Text("Chicago")
                        .font(.title2)
                        .foregroundColor(.gray)

                    Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.body)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.top)
                .padding(.horizontal)
                
                Image("Restaurant-Image")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(15)
                    .clipped()
                    .padding(.trailing)
            }
            
            TextInput(label: "Search Dish", textVariable: $searchText, icon: Image(systemName: "magnifyingglass"))
                .padding(.bottom)
                
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
        .background(primaryGreen)
    }
    
    var foodList: some View {
        VStack() {
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptor()) {
                
                (dishes: [Dish]) in
                List(dishes) { dish in
                    NavigationLink(destination: DishDetails(dish: dish)) {
                        FoodList(dish: dish)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
    
    var foodFilter: some View {
        VStack (alignment: .leading) {
            Text("Order for Delivery")
            
            ScrollView(.horizontal) {
                HStack {
                    ChipButton(label: "Starters", isSelected: $starterDishes)
                    ChipButton(label: "Mains", isSelected: $mainDishes)
                    ChipButton(label: "Sides", isSelected: $sidesDishes)
                    ChipButton(label: "Desserts", isSelected: $dessertsDishes)
                }
            }
        }
        .padding(.horizontal)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            header
            heroSection
            foodFilter
            foodList
        }
        .onAppear(){
            getMenuData()
        }
            
    }
    
    func buildSortDescriptor() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))]
    }

    func buildPredicate() -> NSCompoundPredicate {
        let searchPredicate = searchText.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        
        let mainDishesPredicate = mainDishes ? NSPredicate(format: "category == %@", "mains") : NSPredicate(value: false)
        let starterDishesPredicate = starterDishes ? NSPredicate(format: "category == %@", "starters") : NSPredicate(value: false)
        let sidesDishesPredicate = sidesDishes ? NSPredicate(format: "category == %@", "sides") : NSPredicate(value: false)
        let dessertsDishesPredicate = dessertsDishes ? NSPredicate(format: "category == %@", "desserts") : NSPredicate(value: false)
        
        let categoryPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [mainDishesPredicate, starterDishesPredicate, sidesDishesPredicate, dessertsDishesPredicate])
        
        return NSCompoundPredicate(andPredicateWithSubpredicates: [searchPredicate, categoryPredicate])
    }
    
    func getMenuData() {
        if hasFetchedData { return }
        
        PersistenceController.shared.clear()
        
        let serverString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: serverString)!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard let data = data, error == nil else {
            print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
            return
        }

        let decoder = JSONDecoder()
        if let menuListTemp = try? decoder.decode(MenuList.self, from: data) {
            DispatchQueue.main.async {
                for item in menuListTemp.menu {
                    let dish = Dish(context: viewContext)
                    dish.title = item.title
                    dish.image = item.image
                    dish.price = item.price
                    // Add optional fields here if needed
                    dish.dishDescription = item.description
                    dish.category = item.category
                }
                
                for item in CustomDishes.customDishes {
                    let dish = Dish(context: viewContext)
                    dish.title = item.title
                    dish.image = item.image
                    dish.price = item.price
                    dish.dishDescription = item.description
                    dish.category = item.category
                }

                try? viewContext.save()
                
                hasFetchedData = true
            }
        }
    }

        task.resume()
    }
}
/*
#Preview {
    Menu()
}*/
