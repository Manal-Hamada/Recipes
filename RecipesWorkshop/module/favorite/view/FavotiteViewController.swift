//
//  FavotiteViewController.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import UIKit
import Kingfisher

class FavotiteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var noFavimg: UIImageView!
    @IBOutlet weak var favTableView: UITableView!
    var favRecipes = [Result]()
    var favViewModel : FavViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noFavimg.isHidden =  true
        favTableView.dataSource = self
        favTableView.delegate = self
        
        favViewModel = FavViewModel()
        favViewModel.bindResultToViewController={
            [weak self] in
            DispatchQueue.main.async {
                self?.favRecipes = self?.favViewModel.result ?? [Result]()
                self?.favTableView.reloadData()
            }
        }
        favViewModel.getAllLocalfavRecipes()
        
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        favTableView.register(nib, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favRecipes.count == 0{
            noFavimg.isHidden = false
            return 0
        }
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! RecipeTableViewCell
        
        cell.recipeNameLabel.text = favRecipes[indexPath.row].name
        cell.recipeCatecoryLabel.text = favRecipes[indexPath.row].show?.name
        cell.recipeCrediteNameLabel.text = favRecipes[indexPath.row].credits?[0].name
        cell.recipeServings.text = favRecipes[indexPath.row].yields
        
        let url = URL(string: favRecipes[indexPath.row].thumbnailURL ?? "")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // nav to details and path the selected recipe
    }
    

}
