//
//  DetailsViewController.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab4 on 26/05/2023.
//

import UIKit

class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var similarRecipesCollection: UICollectionView!
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimilarReciepsCell", for: indexPath) as! SimilarReciepsCell
        
        return cell
    }
    
    
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var instructionsTable: UITableView!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var instructionTableHieght: NSLayoutConstraint!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == ingredientsTable{
            return 2
        }
        
        if tableView == instructionsTable{
           return 1
        }
        
        return 0
    }
    

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.bounds.width - (20 * 2), height: sectionView.bounds.height))
        
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16.0)
        
        if(tableView == ingredientsTable){
            switch(section){
            case 0:
                label.text = "Chicken"
            case 1:
                label.text =  "Chicken"
            default:
                break
            }
            
            sectionView.addSubview(label)
            return sectionView
        }
        
       
     return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
       
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == ingredientsTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableCell") as! DetailsTableCell
            cell.label.text = "1 Cup All purpose flour"
            cell.icon.image = UIImage(named: "cell-icon")
            return cell
        }
        
        if tableView == instructionsTable{
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableCell")  as! DetailsTableCell
            cell.label.text = "In a large mixing bowl, whisk together the flour and the egss. Gradually add in the milk and water,In a large mixing bowl, whisk together the flour and the egss. Gradually add in the milk and water,"
            cell.icon.image = UIImage(named: "cell-icon")
            return cell
        }
        
        
        return UITableViewCell()
    }
    
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        similarRecipesCollection.dataSource = self
        similarRecipesCollection.delegate = self
        // Do any additional setup after loading the view.
       
        
    }
    
    override func viewWillLayoutSubviews() {

        let nib = UINib(nibName: "DetailsTableCell", bundle: nil)
        
        ingredientsTable.register(nib, forCellReuseIdentifier: "DetailsTableCell")
        instructionsTable.register(nib, forCellReuseIdentifier: "DetailsTableCell")

        self.tableHeight.constant = self.ingredientsTable.contentSize.height
        self.instructionTableHieght.constant = self.instructionsTable.contentSize.height
        
        let collectionNib = UINib(nibName: "SimilarReciepsCell", bundle: nil)
        similarRecipesCollection.register(collectionNib,forCellWithReuseIdentifier: "SimilarReciepsCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 277, height: 174)
    }
    
}

