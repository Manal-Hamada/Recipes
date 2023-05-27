//
//  FavViewModel.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
class FavViewModel{
    var bindResultToViewController : (()->()) = {}
    var favCoreData : LocalSource?
    
    init(favCoreData: LocalSource) {
        self.favCoreData = favCoreData 
    }
    
    var result : [LocalRecipe]!{
        didSet{
            bindResultToViewController()
        }
    }
    
    func getItems(){
        result = favCoreData?.fetchAll()
    }
    func deleteRecipe(recipeID : Int){
        favCoreData?.deleteRecipe(recipeID: recipeID)
    }
    func insertRecipe(newRecipe: LocalRecipe){
        print("viewmodel \(newRecipe)")
        favCoreData?.insert(newRecipe: newRecipe)
    }
    func ifRecipeIsFav(recipeID : Int)-> Bool{
        guard let result = favCoreData?.getRecipeFromLocal(id: recipeID) else {return false}
        return result
                
    }
}
