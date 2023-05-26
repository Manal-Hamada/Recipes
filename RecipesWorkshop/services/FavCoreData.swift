//
//  FavCoreData.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
import CoreData
import UIKit

class FavCodeData {
    static let sharedDB = FavCodeData()

    var manager : NSManagedObjectContext!
    var recipes : [NSManagedObject] = []

    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manager = appDelegate.persistentContainer.viewContext
    }

    func insert (newRecipe: LocalRecipe){
        //2-
        let entity = NSEntityDescription.entity(forEntityName: "FavMeals", in: manager)
        //3-
        let recipe = NSManagedObject(entity: entity!, insertInto: manager)
        recipe.setValue(newRecipe.id, forKey: "id")
        recipe.setValue(newRecipe.name, forKey: "name")
        recipe.setValue(newRecipe.category, forKey: "category")
        recipe.setValue(newRecipe.owner, forKey: "owner")
        recipe.setValue(newRecipe.yields, forKey: "yields")
        recipe.setValue(newRecipe.bgImg, forKey: "bgImg")

        //4-
        do{
            try manager.save()
            print("Saved!")
        }catch let error{
            print(error.localizedDescription)
        }

    }

    func fetchAll()-> Array<LocalRecipe>{
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "FavMeals")

        do{
            recipes = try manager.fetch(fetch)
        }catch let error{
            print(error.localizedDescription)
        }
        var recipesList = Array<LocalRecipe>()
        for item in recipes{

            let id = item.value(forKey: "id") as? Int
            let name = item.value(forKey: "name") as? String
            let owner = item.value(forKey: "owner") as? String
            let category = item.value(forKey: "category") as? String
            let yields = item.value(forKey: "yields") as? String
            let bgImg = item.value(forKey: "bgImg") as? String
            
            recipesList.append(LocalRecipe(id: id ?? 0,name: name ?? "", owner: owner ?? "", category: category ?? "", yields: yields ?? "",bgImg: bgImg ?? ""))
        }
        return recipesList
    }
    

    func deleteRecipe(recipeID:Int){
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "FavMeals")
        //var leagues = self.fetchAll()

        let predicate = NSPredicate(format: "id == \(recipeID)")
        fetch.predicate = predicate

        var fetchObject = [NSManagedObject]()
        do{
            fetchObject = try manager.fetch(fetch)

        }catch let error{
            print(error.localizedDescription)
        }
        manager.delete(fetchObject[0])
        do{
            try manager.save()
            print("Deleted!")
        }catch let error{
            print(error.localizedDescription)
        }
    }

    //    func deleteAll (){
    //
    //        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Movie")
    //
    //        do{
    //            movies = try manager.fetch(fetch)
    //        }catch let error{
    //            print(error.localizedDescription)
    //        }
    //
    //        for item in movies{
    //            manager.delete(item)
    //        }
    //        do{
    //            try manager.save()
    //            print("Deleted all!")
    //        }catch let error{
    //            print(error.localizedDescription)
    //        }
    //
    //    }
}
