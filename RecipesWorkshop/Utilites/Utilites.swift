//
//  Utilites.swift
//  RecipesWorkshop
//
//  Created by Mac on 27/05/2023.
//

import Foundation


struct CategoryCollection{
    var categoryName : String!
    var cataegoryImg : String!
    
    init(categoryName: String!, cataegoryImg: String!) {
        self.categoryName = categoryName
        self.cataegoryImg = cataegoryImg
    }
    
}


    

let category1 = CategoryCollection(categoryName: "Popular", cataegoryImg: "fire")
let category2 = CategoryCollection(categoryName: "Breakfast", cataegoryImg: "breakfast")
let category3 = CategoryCollection(categoryName: "Launch", cataegoryImg: "lunch")
let category4 = CategoryCollection(categoryName: "Dinner", cataegoryImg: "dinner")
let category5 = CategoryCollection(categoryName: "Dessert", cataegoryImg: "cake")
let categories = [category1,category2,category3,category4,category5]
let categoryNames = ["breakfast","middle_eastern","lunch","dinner","desserts"]

/*enum CategoryNamesEnum{
    case breakfast
    case middle_eastern
    case lunch
    case dinner
    case desserts
    
}*/
