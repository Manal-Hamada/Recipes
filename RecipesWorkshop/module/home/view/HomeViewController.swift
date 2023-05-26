import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITabBarDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var categoryItems : Array<Result>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryItems = []
        self.categoryCollection.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        
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
        switch indexPath.row{
            
        case 0 :
            cell.categoryImg.image = UIImage(named: "fire")
            cell.categoryName.text = "Popular"
        case 1 :
            cell.categoryImg.image = UIImage(named: "breakfast")
            cell.categoryName.text = "Breakfast"
        case 2 :
            cell.categoryImg.image = UIImage(named: "lunch")
            cell.categoryName.text = "Launch"
        case 3 :
            cell.categoryImg.image = UIImage(named: "dinner")
            cell.categoryName.text = "Dinner"
        default:
            cell.categoryImg.image = UIImage(named: "cake")
            cell.categoryName.text = "Dessert"
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedItem : CategoryCollectionViewCell = categoryCollection.cellForItem(at: indexPath)! as! CategoryCollectionViewCell
        selectedItem.bg.backgroundColor = UIColor(named: "main")
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
