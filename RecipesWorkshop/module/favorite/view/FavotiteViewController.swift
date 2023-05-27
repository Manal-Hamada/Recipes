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
    var favRecipes : [LocalRecipe] = Array<LocalRecipe>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noFavImg.isHidden = true
        favTableView.dataSource = self
        favTableView.delegate = self
        
        favViewModel = FavViewModel(favCoreData: FavCodeData.sharedDB)
        
//        let recipe = LocalRecipe(id: 1, name: "name", owner: "owner", category: "cat", yields: "tield", bgImg: "")
//        favViewModel.insertRecipe(newRecipe: recipe)
        
        favViewModel.bindResultToViewController = {
            [weak self] in
            DispatchQueue.main.async {
                self?.favRecipes = self?.favViewModel.result ?? [LocalRecipe]()
                if (self?.favRecipes.count == 0){
                    self?.noFavImg.isHidden = false
                }
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
        cell.favBtn.imageView?.image = UIImage(systemName: "heart.fill")
        cell.onclickOnFavBtn = {
            let alert : UIAlertController = UIAlertController(title: "ALERT!", message: "ARE YOU SURE TO DELETE?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "YES", style: .default,handler: { [weak self] action in
                self?.favViewModel.deleteRecipe(recipeID: self?.favRecipes[indexPath.row].id ?? 0)
                self?.favViewModel.getItems()
                self?.favTableView.reloadData()
                
            }))
            alert.addAction(UIAlertAction(title: "NO", style: .cancel,handler: { action in
                cell.favBtn.imageView?.image = UIImage(systemName: "heart.fill")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        let url = URL(string: favRecipes[indexPath.row].bgImg ?? "")
        
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
