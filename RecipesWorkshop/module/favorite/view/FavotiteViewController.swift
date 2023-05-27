import UIKit

class FavotiteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var favTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favTableView.dataSource = self
        favTableView.delegate = self
        
        let nib = UINib(nibName: "RecipeTableViewCell", bundle: nil)
        favTableView.register(nib, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! RecipeTableViewCell
        
        return cell
    }

}
