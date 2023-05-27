import Foundation


protocol HomeViewModelType {
    
    var bindCategoryMealsToViewController : (()->())? { get set }
    var bindCategoryCellsToViewController : (()->())? { get set }
    
    func fetchCategoryMeals(tag:String,endPoint:EndPoint)
    func getRecipesCount () -> Int
    func getRecipeAtIndexPath(row : Int) -> Result
    func getCategoriesCount() -> Int
    func getCategoryAtIndexPath(row : Int) -> HomeCollectionViewCellViewModel
    
    
}

class HomeViewModel : HomeViewModelType{
   
    var network: NetworkServicing!
    init(network : NetworkServicing){
        
        self.network = network
    }
    
    var bindCategoryMealsToViewController: (() -> ())?
    var bindCategoryCellsToViewController: (() -> ())?
  
    var categories : [HomeCollectionViewCellViewModel] = HomeCollectionViewCellViewModel().setCategories()
    var result : [Result] = []
    
    var cellResults : [HomeTableCellViewModel]!{
        didSet{
            bindCategoryCellsToViewController?()
        }
    }
    
    func fetchCategoryMeals(tag:String,endPoint:EndPoint){
        
        network.getDataOverNetwork(tag: tag, endPoint: endPoint, compilitionHandler:{  [weak self] (result : MyResponse?) in
            
            self?.result = result?.results ?? []
            self?.bindCategoryMealsToViewController?()
  
        })
        
    }
    
    func getRecipesCount() -> Int {
        result.count
    }
    
    func getRecipeAtIndexPath(row: Int) -> Result {
        result[row]
    }
    
    func getCategoriesCount() -> Int {
        return categories.count
    }
    
    func getCategoryAtIndexPath(row: Int) -> HomeCollectionViewCellViewModel {
        return categories[row]
    }
    
}


