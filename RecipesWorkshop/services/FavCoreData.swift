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
<<<<<<< HEAD
    
    var manager : NSManagedObjectContext!
    var recipes : [NSManagedObject] = []
    
=======

    var manager : NSManagedObjectContext!
    var recipes : [NSManagedObject] = []

>>>>>>> fav-core-data
    private init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        manager = appDelegate.persistentContainer.viewContext
    }
<<<<<<< HEAD
    
    func insert (newLeagues : Result){
//        //2-
//        let entity = NSEntityDescription.entity(forEntityName: "Leagues", in: manager)
//        //3-
//        let leagues = NSManagedObject(entity: entity!, insertInto: manager)
//        leagues.setValue(newLeagues.leagueKey, forKey: "leagueKey")
//        leagues.setValue(newLeagues.leagueName, forKey: "leagueName")
//        leagues.setValue(newLeagues.leagueLogo, forKey: "leagueLogo")
//        leagues.setValue(newLeagues.countryKey, forKey: "countryKey")
//        leagues.setValue(newLeagues.countryName, forKey: "countryName")
//        leagues.setValue(newLeagues.countryLogo, forKey: "countryLogo")
//
//        //4-
//        do{
//            try manager.save()
//            print("Saved!")
//        }catch let error{
//            print(error.localizedDescription)
//        }
        
    }
    
    func fetchAll()-> Array<Result>{
//        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
//
//        do{
//            leagues = try manager.fetch(fetch)
//        }catch let error{
//            print(error.localizedDescription)
//        }
//        var league = Result()
        var leaguesList = Array<Result>()
//        for item in leagues{
//
//            league.leagueKey = item.value(forKey: "leagueKey") as? Int
//            league.leagueName = item.value(forKey: "leagueName") as? String
//            league.leagueLogo = item.value(forKey: "leagueLogo") as? String
//            league.countryKey = item.value(forKey: "countryKey") as? Int
//            league.countryName = item.value(forKey: "countryName") as? String
//            league.countryLogo = item.value(forKey: "countryLogo") as? String
//
//            leaguesList.append(league)
//            league = Result()
//        }
        return leaguesList
    }
    
    func deleteMovie(newLeague:Result){
//        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
//        //var leagues = self.fetchAll()
//
//        let predicate = NSPredicate(format: "leagueKey == \(newLeague.leagueKey ?? 0)")
//        fetch.predicate = predicate
//
//        var fetchObject = [NSManagedObject]()
//        do{
//            fetchObject = try manager.fetch(fetch)
//
//        }catch let error{
//            print(error.localizedDescription)
//        }
//        manager.delete(fetchObject[0])
//        do{
//            try manager.save()
//            print("Deleted!")
//        }catch let error{
//            print(error.localizedDescription)
//        }
    }
    
=======

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

>>>>>>> fav-core-data
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
