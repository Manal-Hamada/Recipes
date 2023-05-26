//
//  FavViewModel.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
class FavViewModel{
    var bindResultToViewController : (()->()) = {}
    var favCoreData = FavCodeData.sharedDB
    
    var result : [LocalRecipe]!{
        didSet{
            bindResultToViewController()
        }
    }
    
    func getItems(){
        result = favCoreData.fetchAll()
    }
    func deleteRecipe(recipeID : Int){
        favCoreData.deleteRecipe(recipeID: recipeID)
    }
    func insertRecipe(newRecipe: LocalRecipe){
        print("viewmodel \(newRecipe)")
        favCoreData.insert(newRecipe: newRecipe)
    }
}
