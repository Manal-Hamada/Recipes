//
//  dumy.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation
import Alamofire

protocol NetworkServicing{
    
    func getDataOverNetwork<T:Decodable>(url:String, compilitionHandler: @escaping (T?) -> Void)
}
class NetworkManager : NetworkServicing{
    
    
    func getDataOverNetwork<T:Decodable>(url :String, compilitionHandler: @escaping (T?) -> Void)
    {
        
        let header: HTTPHeaders = [
            "X-RapidAPI-Key": "18beea3c30msha8cf6449f96b814p13fb95jsn2277702dfdff",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=\(url)", method: .get, headers: header).responseJSON{ response in
            do{
                let result = try JSONDecoder().decode(T.self, from: response.data!)
                debugPrint(result)
                compilitionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
    
    
}
    

