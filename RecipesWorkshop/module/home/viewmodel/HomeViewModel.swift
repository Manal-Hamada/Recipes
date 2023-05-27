import Foundation


protocol HomeViewModelType {
    
    var bindCategoryMealsToViewController : (()->())? { get set }
    var bindCategoryCellsToViewController : (()->())? { get set }
    
    func fetchCategoryMeals(tag:String,endPoint:EndPoint)
    func getRecipesCount () -> Int
    func getRecipeAtIndexPath(row : Int) -> Result
    func getCategoriesCount() -> Int
    func getCategoryAtIndexPath(row : Int) -> HomeCollectionViewCellViewModel
    func deleteRecipe(recipeID : Int)
    func insertRecipe(newRecipe: LocalRecipe)
    func ifRecipeIsFav(recipeID : Int)-> Bool
}

class HomeViewModel : HomeViewModelType{
   
    
    var bindCategoryMealsToViewController: (() -> ())?
    var bindCategoryCellsToViewController: (() -> ())?
    var networkManager : NetworkManager = NetworkManager()
    var favCoreData : LocalSource?
    var categories : [HomeCollectionViewCellViewModel] = HomeCollectionViewCellViewModel().setCategories()
    var result : [Result] = []
    
    init(favCoreData: LocalSource) {
        self.favCoreData = favCoreData
    }
    var cellResults : [HomeTableCellViewModel]!{
        didSet{
            bindCategoryCellsToViewController?()
        }
    }
    
    func fetchCategoryMeals(tag:String,endPoint:EndPoint){
        
        networkManager.getDataOverNetwork(tag: tag, endPoint: endPoint, compilitionHandler:{  [weak self] (result : MyResponse?) in
            
            self?.result = result?.results ?? []
            self?.bindCategoryMealsToViewController?()
            
            
        })
        
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


