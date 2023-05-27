import XCTest
@testable import RecipesWorkshop

final class RecipesWorkshopTests: XCTestCase {

    var network :NetworkManager!
    var homeViewModel : HomeViewModelType!
    var categories : [HomeCollectionViewCellViewModel]!
    
    override func setUpWithError() throws {
        
        network = NetworkManager()
        homeViewModel = HomeViewModel(network: network)
        
        let category1 = HomeCollectionViewCellViewModel(categoryName: "Popular", cataegoryImg: "fire",categoryendpoint: "breakfast")
        let category2 = HomeCollectionViewCellViewModel(categoryName: "Breakfast", cataegoryImg: "breakfast",categoryendpoint: "middle_eastern")
        let category3 = HomeCollectionViewCellViewModel(categoryName: "Launch", cataegoryImg: "lunch",categoryendpoint: "lunch")
        let category4 = HomeCollectionViewCellViewModel(categoryName: "Dinner", cataegoryImg: "dinner",categoryendpoint: "dinner")
        let category5 = HomeCollectionViewCellViewModel(categoryName: "Dessert", cataegoryImg: "cake",categoryendpoint:  "desserts")
        categories = [category1,category2,category3,category4,category5]
        
    }

    func testFetchingRecibes(){
        
        homeViewModel.fetchCategoryMeals(tag: "list?from=0&size=20&tags=" , endPoint:.recipes)
    }
    
    func testGetCategoriesCount(){
        var count = homeViewModel.getCategoriesCount()
        
        XCTAssert(count == 5)
    }
    
    override func tearDownWithError() throws {
       
      
    
    }

    func testExample() throws {
      
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
