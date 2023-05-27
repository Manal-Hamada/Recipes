//
//  dumy.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
import Alamofire

protocol NetworkServicing{
    
    func getDataOverNetwork<T:Decodable>(tag :String,endPoint : EndPoint, compilitionHandler: @escaping (T?) -> Void)
    
}

class NetworkManager : NetworkServicing{
    
    
    var baseUrl = "https://tasty.p.rapidapi.com/recipes/"
    var recipesendPoint = "list?from=0&size=20&tags="
    
    func getDataOverNetwork<T:Decodable>(tag :String,endPoint : EndPoint, compilitionHandler: @escaping (T?) -> Void)
    {
        
        let header: HTTPHeaders = [
            "X-RapidAPI-Key": "18beea3c30msha8cf6449f96b814p13fb95jsn2277702dfdff",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("\(baseUrl)\(endPoint.rawValue)\(tag)", method: .get, headers: header).responseJSON{ response in
            print(response)
            do{
                let result = try JSONDecoder().decode(T.self, from: response.data ?? Data())
                debugPrint(result)
                compilitionHandler(result)
            }catch let error {
                print("Network error")
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
    
    
}

enum EndPoint: String {
    
    case  recipes = "list?from=0&size=20&tags="
    case listSimilarites = "list-similarites?recipe_id="
    case getMoreInfo = "get-more-info?id="
}


