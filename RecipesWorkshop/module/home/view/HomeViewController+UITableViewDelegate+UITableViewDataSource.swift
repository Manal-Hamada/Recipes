import UIKit
import Lottie
import Kingfisher
import Reachability

extension HomeViewController :UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.recipesTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeTableViewCell
        
        return self.dequeueCell(row: indexPath.row, cell: cell)
    }
    
    
    func dequeueCell(row:Int,cell:RecipeTableViewCell) ->RecipeTableViewCell{
        
        let recipe = viewModel?.getRecipeAtIndexPath(row: row)
        let mealImgUrl = URL(string: recipe?.thumbnailURL ?? "")
        
        cell.recipeBgImg.layer.cornerRadius = 20.0
        cell.recipeBgImg.kf.setImage(with: mealImgUrl)
        cell.recipeServingsLabel.text = "\(String(describing: recipe?.numServings ?? 0))"
        cell.recipeOwnerName.text = recipe?.credits?[0].name
        cell.recipeNameLabel.text = recipe?.name
        cell.recipeCategoryLabel.text = recipe?.show?.name
        guard let result = self.viewModel?.ifRecipeIsFav(recipeID: recipe?.id ?? 0 ) else {
            return RecipeTableViewCell()
        }
        if result{
            cell.favBtn.imageView?.image = UIImage(systemName: "heart.fill")
        }else{
            cell.favBtn.imageView?.image = UIImage(systemName: "heart")
        }
        
        cell.onclickOnFavBtn = {
            guard let result = self.viewModel?.ifRecipeIsFav(recipeID: recipe?.id ?? 0 ) else {return}
            if result{
                let alert : UIAlertController = UIAlertController(title: "ALERT!", message: "ARE YOU SURE TO DELETE?", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "YES", style: .default,handler: { [weak self] action in
                    self?.viewModel?.deleteRecipe(recipeID: recipe?.id ?? 0)
                    cell.favBtn.imageView?.image = UIImage(systemName: "heart")
                    self?.recipesTable.reloadData()
                    
                }))
                alert.addAction(UIAlertAction(title: "NO", style: .cancel,handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                self.viewModel?.insertRecipe(newRecipe: LocalRecipe(id: recipe?.id, name: recipe?.name, owner: recipe?.credits?[0].name, category: recipe?.show?.name, yields: recipe?.yields, bgImg: recipe?.thumbnailURL))
                cell.favBtn.imageView?.image = UIImage(systemName: "heart.fill")
                self.recipesTable.reloadData()
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getRecipesCount() ?? 0
    }
    
}
