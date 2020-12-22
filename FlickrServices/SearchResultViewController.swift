import UIKit

class SearchResultViewController: UITableViewController {
    
    var searchResult: String?
    
    var searchResultItems: Array<PhotoInfo> = []
    
    let networkController = NetworkController(baseUrl: "https://www.flickr.com", session: URLSession.shared, apiKey: "fb0bbda58670a6cc760f519c763b650f")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Result"
        print(searchResult)
        //searchResultItems.append(searchResult ?? "")
        networkController.fetchSearchInfo(search: searchResult ?? "") { (SearchResult) in
            self.searchResultItems = SearchResult.photos.photo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(SearchResult)
        }
    }
    
    // three core items in Table View
    // number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

   // number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultItems.count
    }

   // where we configure and putting data into the UI
  // loading up cells (Cell Creation) created by copying a prototype cell you configure in your storyboard
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = SearchResultViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "searchResultCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as! SearchResultViewCell
        
//        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        let result = searchResultItems[indexPath.row]
        
        networkController.fetchImge(url: result.url_s) { (photo) in
            print("photo loaded")
            DispatchQueue.main.async {
                cell.searchResultTitle?.text = result.title
                cell.searchResultImageView?.image = photo
                print("The loaded image: \(cell.imageView?.image)")
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        if(segue.identifier == "detailedView") {
            let detailedView = segue.destination as! DetailedViewController
            let selectedCell = sender as! SearchResultViewCell
            let indexPath = self.tableView.indexPath(for: selectedCell)!
            let result = searchResultItems[indexPath.row]
            detailedView.details = result
            print(selectedCell.imageView)
           
        }
    }
}
