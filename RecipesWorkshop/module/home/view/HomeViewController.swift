import UIKit
import Lottie
import Kingfisher
import Reachability

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var loading: AnimationView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var recipesTable: UITableView!
    
    var viewModel : HomeViewModelType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.layer.cornerRadius = 20.0
      
        
        viewModel = HomeViewModel(network: NetworkManager())
        self.categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        recipesTable.register(nib, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        playLottie()
        getData(categoryName: viewModel?.getCategoryAtIndexPath(row: 0).categoryendpoint ?? "")
    }
    
    func getData(categoryName:String){
        
        self.viewModel?.bindCategoryMealsToViewController = {[weak self] in
            DispatchQueue.main.async {
                self?.recipesTable.reloadData()
                self?.loading.stop()
                self?.recipesTable.isHidden = false
            }
        }
        viewModel?.fetchCategoryMeals(tag: categoryName, endPoint: .recipes)
    }
    
    
    func playLottie(){
        recipesTable.isHidden = true
        self.loading.contentMode = .scaleAspectFit
        self.loading.loopMode = .loop
        self.loading.animationSpeed = 0.5
        self.loading.play()
    
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : CategoryCollectionViewCell  = categoryCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.bg.layer.cornerRadius = 20.0
        
    
        let category = viewModel?.getCategoryAtIndexPath(row: indexPath.row)
        
        if indexPath.row == 0 {
            cell.isSelected = true
            cell.bg.backgroundColor = UIColor(named: "main")
        }

        
        cell.categoryImg.image = UIImage(named: category?.cataegoryImg ?? "")
        cell.categoryName.text = category?.categoryName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        playLottie()
        let selectedItem : CategoryCollectionViewCell = categoryCollection.cellForItem(at: indexPath)! as! CategoryCollectionViewCell
        selectedItem.bg.backgroundColor = UIColor(named: "main")
        self.UnSelectItems(selectedItem: indexPath,collectionView: collectionView)
        viewModel?.fetchCategoryMeals(tag: viewModel?.getCategoryAtIndexPath(row: indexPath.row).categoryendpoint ?? "", endPoint: .recipes)
       //getData(categoryName:viewModel?.getCategoryAtIndexPath(row: indexPath.row).categoryendpoint ?? "" )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = categoryCollection.frame.width

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
    
    
    
}
