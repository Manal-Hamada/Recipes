import Foundation

class HomeViewModel{
    
    var networkManager : NetworkManager = NetworkManager()
    var bindCategoryMealsToViewController : (()->()) = {}
    var result : [Result]!{
        didSet{
            bindCategoryMealsToViewController()
        }
    }
    
    
    func fetchCategoryMeals(url:String){
        
        networkManager.getDataOverNetwork(url: url) {  [weak self] (result : MyResponse?) in
            
            self?.result = result?.results
            
            
        }
        
       
        
    }
}
