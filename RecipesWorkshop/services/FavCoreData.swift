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
