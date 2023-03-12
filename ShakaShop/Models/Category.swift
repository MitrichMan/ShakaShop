//
//  Category.swift
//  ShakaShop
//
//  Created by Dmitrii Melnikov on 10.03.2023.
//

struct Category {
    let name: String
    let products: [Product]
}

struct Product {
    let name: String
    let description: String
    let feature: String
    let pictures: [String]
    let price: Int
    let category: String
}

extension Category {
    static func getCategories() -> [Category] {
        var category: [Category] = []
        
        for selectedCategory in ProductsData.Categories.allCases {
            let categoryName = selectedCategory
            let products = Product.getProducts()
            var productsForCategory: [Product] = []
             
            for product in products {
                if product.category == selectedCategory.rawValue {
                    productsForCategory.append(product)
                }
            }
        
            category.append(
                Category(
                    name: categoryName.rawValue,
                    products: productsForCategory
                )
            )
        }
        
        return category
    }
}

extension Product {
    static func getProducts() -> [Product] {
        var products: [Product] = []
        
        for index in 0..<ProductsData.shared.productNames.count {
            let names = ProductsData.shared.productNames
            let descriptions = ProductsData.shared.productDescription
            let features = ProductsData.shared.productFeatures
            let prices = ProductsData.shared.productPrices
            let categories = ProductsData.shared.productsByCategories
            
            let pictures = categories[names[index]] == ProductsData.Categories.surfBoards
            ? ["\(names[index]) 1", "\(names[index]) 2"]
            : ["\(names[index]) 1", "\(names[index]) 1"]
            
            products.append(
                Product(
                    name: names[index],
                    description: descriptions[names[index]] ?? "",
                    feature: features[names[index]] ?? "",
                    pictures: pictures,
                    price: prices[names[index]] ?? 0,
                    category: categories[names[index]]?.rawValue ?? ""
                )
            )
        }
        
        return products
    }
}


