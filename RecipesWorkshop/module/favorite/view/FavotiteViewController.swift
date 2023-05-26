//
//  FavotiteViewController.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import UIKit
import Kingfisher

class FavotiteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var noFavImg: UIImageView!
    @IBOutlet weak var favTableView: UITableView!
    var favViewModel : FavViewModel!
    var favRecipes : [LocalRecipe] = [LocalRecipe(id: 1, name: "name1", owner: "owner1", category: "cat1", yields: "yiels1", bgImg: "bg1"),LocalRecipe(id: 2, name: "name2", owner: "owner2", category: "cat2", yields: "yiels2", bgImg: ""),LocalRecipe(id: 3, name: "name3", owner: "owner3", category: "cat3", yields: "yiels3", bgImg: ""),LocalRecipe(id: 4, name: "name4", owner: "owner4", category: "cat4", yields: "yiels4", bgImg: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noFavImg.isHidden = true
        favTableView.dataSource = self
        favTableView.delegate = self
        
        favViewModel = FavViewModel()
        
        for item in favRecipes {
            print(item)
            favViewModel.insertRecipe(newRecipe: item)
        }
        favViewModel.insertRecipe(newRecipe: LocalRecipe(id: 5, name: "name5", owner: "owner5", category: "cat15", yields: "yiels5", bgImg: "bg5"))
        favViewModel.bindResultToViewController={
            [weak self] in
            DispatchQueue.main.async {
                self?.favRecipes = self?.favViewModel.result ?? [LocalRecipe]()
                self?.favTableView.reloadData()
            }
        }
        favViewModel.getItems()
        
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        favTableView.register(nib, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favRecipes.count == 0{
            noFavImg.isHidden = false
            return 0
        }
        return favRecipes.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! RecipeTableViewCell
        
        cell.recipeNameLabel.text = favRecipes[indexPath.row].name
        cell.recipeOwnerName.text = favRecipes[indexPath.row].owner
        cell.recipeCategoryLabel.text = favRecipes[indexPath.row].category
        cell.recipeServingsLabel.text = favRecipes[indexPath.row].yields
        cell.recipeID = favRecipes[indexPath.row].id
        
        let url = URL(string: favRecipes[indexPath.row].bgImg)
        
        cell.recipeBgImg.kf.setImage(
              with: url,
              placeholder: UIImage(named: "background"),
              options: [
                  .scaleFactor(UIScreen.main.scale),
                  .transition(.fade(1)),
                  .cacheOriginalImage
              ])
        
        return cell
    }

}
