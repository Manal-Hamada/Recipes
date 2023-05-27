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
        
        cell.mealImg.layer.cornerRadius = 20.0
        cell.mealImg.kf.setImage(with: mealImgUrl)
        cell.servings.text = "\(String(describing: recipe?.numServings ?? 0))"
        cell.chefName.text = recipe?.credits?[0].name
        cell.mealName.text = recipe?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getRecipesCount() ?? 0
    }
 
}
