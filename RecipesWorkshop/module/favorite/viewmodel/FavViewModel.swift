//
//  FavViewModel.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation

class FavViewModel{
    var favCoreData = FavCodeData.sharedDB
    
    var bindResultToViewController : (()->()) = {}
    var result : [Result]!{
        didSet{
            bindResultToViewController()
        }
    }
    
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
    
    
    

}
