import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "searchResult") {
            let searchResultView = segue.destination as! SearchResultViewController
            searchResultView.searchResult = searchInput.text
        }
    }
}

