import UIKit
import Kingfisher
import Reachability

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var recipesTable: UITableView!
    var categoryItems : Array<Result>!
    var viewModel : HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        categoryItems = []
        self.categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        recipesTable.register(nib, forCellReuseIdentifier: "cell")
        getData(categoryName: "breakfast")
        
        
        print("items count \(categoryItems.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData(categoryName: "breakfast")
    }
    
    func getData(categoryName:String){
        self.categoryItems = []
        self.recipesTable.reloadData()
        recipesTable.alpha = 0
        
        self.viewModel.bindCategoryMealsToViewController = {[weak self ] in
            DispatchQueue.main.async { [self] in
                self?.categoryItems = self?.viewModel.result
                self!.recipesTable.reloadData()
            }
            
        }
        viewModel.fetchCategoryMeals(url: categoryName)
        recipesTable.alpha = 1
    }
    
    func testNetwork(){
       

        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CategoryCollectionViewCell  = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.bg.layer.cornerRadius = 20.0
        
        
        var img = ""
        var name = ""
        
        switch indexPath.row{
            
        case 0 :
            name = categories[0].categoryName
            img = categories[0].cataegoryImg
            cell.bg.backgroundColor = UIColor(named: "main")
        case 1 :
            name = categories[1].categoryName
            img = categories[1].cataegoryImg
        case 2 :
            name = categories[2].categoryName
            img = categories[2].cataegoryImg
        case 3 :
            name = categories[3].categoryName
            img = categories[3].cataegoryImg
        default:
            name = categories[4].categoryName
            img = categories[4].cataegoryImg
            
        }
        cell.categoryImg.image = UIImage(named: img)
        cell.categoryName.text = name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem : CategoryCollectionViewCell = categoryCollection.cellForItem(at: indexPath)! as! CategoryCollectionViewCell
        selectedItem.bg.backgroundColor = UIColor(named: "main")
        getData(categoryName:categoryNames[indexPath.row] )
        self.UnSelectItems(selectedItem: indexPath,collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = categoryCollection.frame.width /*UIScreen.main.bounds.width*/
        
        
        
        return CGSize(width:( width/5 - 2 ), height: 100)
    }
    
    func UnSelectItems(selectedItem:IndexPath,collectionView:UICollectionView){
        
        for otherIndexPath in collectionView.indexPathsForVisibleItems{
            
            if selectedItem != otherIndexPath{
                let unSelectedItem : CategoryCollectionViewCell = categoryCollection.cellForItem(at: otherIndexPath)! as! CategoryCollectionViewCell
                unSelectedItem.bg.backgroundColor = UIColor(named: "categorybg")
            }
            
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}


extension HomeViewController :UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.recipesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
        let mealImgUrl = URL(string: categoryItems[indexPath.row].thumbnailURL ?? "")
        cell.mealImg.layer.cornerRadius = 20.0
        cell.mealImg.kf.setImage(with: mealImgUrl)
        cell.servings.text = "\(String(describing: categoryItems[indexPath.row].numServings ?? 0))"
        cell.chefName.text = categoryItems[indexPath.row].credits?[0].name
        cell.mealName.text = categoryItems[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
