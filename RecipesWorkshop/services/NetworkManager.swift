//
//  dumy.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import Foundation

protocol NetworkServicing{
    
    func getDataOverNetwork(url:String, compilitionHandler: @escaping (MyResponse?) -> Void)
}
class NetworkManager : NetworkServicing{
    
    func getDataOverNetwork(url:String, compilitionHandler: @escaping (MyResponse?) -> Void)
    {
        
        var header: HTTPHeaders = [
            "X-RapidAPI-Key": "18beea3c30msha8cf6449f96b814p13fb95jsn2277702dfdff",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        AF.request("https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=breakfast", method: .get, headers: header).responseJSON{ response in
            do{
                //if(response.result.isSuccess){
                let result: MyResponse = try JSONDecoder().decode(MyResponse.self, from: response.data!)
                print("leagues size : \(result.results?.count)")
                debugPrint(result)
                compilitionHandler(result)
                // }
            }catch let error {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
}
