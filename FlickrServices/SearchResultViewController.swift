import UIKit

class SearchResultViewController: UITableViewController {
    
    var searchResult: String?
    
    var searchResultItems: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Result"
        print(searchResult)
        searchResultItems.append(searchResult ?? "")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath)
        
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        let result = searchResultItems[indexPath.row]
        cell.textLabel?.text = result.description
        return cell
    }
}
