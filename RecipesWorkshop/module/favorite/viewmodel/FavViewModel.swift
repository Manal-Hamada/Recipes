//
//  FavViewModel.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
<<<<<<< HEAD

class FavViewModel{
    var favCoreData = FavCodeData.sharedDB
    
    var bindResultToViewController : (()->()) = {}
    var result : [Result]!{
=======
class FavViewModel{
    var bindResultToViewController : (()->()) = {}
    var favCoreData = FavCodeData.sharedDB
    
    var result : [LocalRecipe]!{
>>>>>>> fav-core-data
        didSet{
            bindResultToViewController()
        }
    }
    
<<<<<<< HEAD
//    func getItems(){
//        NetworkManager().getDataOverNetwork(url: "") { [weak self] (result: MyResponse?) in
//            self?.result=result?.results
//        }
//    }
    
    func getAllLocalfavRecipes(){
        result = favCoreData.fetchAll()
    }
    func addToLocalfavRecipes(newFavRecipe : Result){
         favCoreData.insert(newLeagues: newFavRecipe)
    }
    
    
    

=======
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
>>>>>>> fav-core-data
}
