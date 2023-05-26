//
//  DetailsViewController.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab4 on 26/05/2023.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var instructionsTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == ingredientsTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell")
            cell?.textLabel!.text = "Haidy"
            return cell!
        }
        
        if tableView == instructionsTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "instructionsCell")
            cell?.textLabel?.text = "Muhammed"
            return cell!
        }
        
        
        return UITableViewCell()
    }
    
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

