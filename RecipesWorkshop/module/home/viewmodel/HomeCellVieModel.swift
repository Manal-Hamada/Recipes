import Foundation


struct HomeCollectionViewCellViewModel{
    var categoryName : String!
    var cataegoryImg : String!
    var categoryendpoint : String!
    
    init(categoryName: String!, cataegoryImg: String!,categoryendpoint:String!) {
        self.categoryName = categoryName
        self.cataegoryImg = cataegoryImg
        self.categoryendpoint = categoryendpoint
    }
    
    init(){
        
    }
    func setCategories() -> [HomeCollectionViewCellViewModel]{
        
        let category1 = HomeCollectionViewCellViewModel(categoryName: "Popular", cataegoryImg: "fire",categoryendpoint: "breakfast")
        let category2 = HomeCollectionViewCellViewModel(categoryName: "Breakfast", cataegoryImg: "breakfast",categoryendpoint: "middle_eastern")
        let category3 = HomeCollectionViewCellViewModel(categoryName: "Launch", cataegoryImg: "lunch",categoryendpoint: "lunch")
        let category4 = HomeCollectionViewCellViewModel(categoryName: "Dinner", cataegoryImg: "dinner",categoryendpoint: "dinner")
        let category5 = HomeCollectionViewCellViewModel(categoryName: "Dessert", cataegoryImg: "cake",categoryendpoint:  "desserts")
        return [category1,category2,category3,category4,category5]
        
    }
}

struct HomeTableCellViewModel{
    
    var mealName : String = ""
    var chefName : String = ""
    var servingNum : Int = 0
    var type : String = ""
    
    init(mealName: String, chefName: String, servingNum: Int, type: String) {
        self.mealName = mealName
        self.chefName = chefName
        self.servingNum = servingNum
        self.type = type
    }

}



let categoryNames = ["breakfast","middle_eastern","lunch","dinner","desserts"]

