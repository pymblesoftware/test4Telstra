
import UIKit
import ImageLoader

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet weak var tblView: UITableView!
    
    
    var presenter = ItemsPresenter()
    var dataModels: [DataModel]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         presenter.fetch(completion: { data in
            self.dataModels = data
            self.tblView.reloadData()
        })
        
        tblView.dataSource = self
        tblView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        if( dataModels != nil ) {
            result = dataModels!.count
        }
        return result
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tblView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TableViewCell
        cell.backgroundColor = UIColor.white
        if(  dataModels != nil ) {
            cell.title.text = dataModels![indexPath.row].title
            cell.desc.text = dataModels![indexPath.row].description
            
            
            let urlString = dataModels![indexPath.row].imageHref
            
            if( urlString != nil ) {
                let urlStr = urlString!.replacingOccurrences(of:"http://", with: "https://")
                let url = URL(string: urlStr)
                print( "--  \(urlStr)  --" )
                
               
                    ImageLoader.request(with: url!, onCompletion: { img, err, op  in
                         DispatchQueue.main.async {
                            cell.imageView?.image = img
                        }
                    })
                
            }
        }
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }



}

