import UIKit

class DetailedViewController: UIViewController {

    var details: PhotoInfo?
    
    @IBOutlet weak var detailedImage: UIImageView!
    
    let networkController = NetworkController(baseUrl: "https://www.flickr.com", session: URLSession.shared, apiKey: "fb0bbda58670a6cc760f519c763b650f")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(details)
        if let imageURL = details?.url_s {
            networkController.fetchImge(url: imageURL) { (photo) in
                DispatchQueue.main.async {
                    self.detailedImage.image = photo
                }
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
