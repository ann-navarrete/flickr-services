//
//  SearchResultViewCell.swift
//  FlickrServices
//
//  Created by Ann Navarrete on 22/12/20.
//

import UIKit

class SearchResultViewCell : UITableViewCell {
    
    @IBOutlet weak var searchResultImageView: UIImageView!

    @IBOutlet weak var searchResultTitle: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
       }

       // Here you can customize the appearance of your cell
       override func layoutSubviews() {
           super.layoutSubviews()
           // Customize imageView like you need
        self.imageView?.frame = CGRect(x: 10,y: 0,width: 40,height: 40)
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
           // Costomize other elements
        self.textLabel?.frame = CGRect(x: 60, y: 0, width: self.frame.width - 45, height: 20)
        self.detailTextLabel?.frame = CGRect(x: 60, y: 20, width: self.frame.width - 45, height: 15)
       }
}

class Image {
    var image: UIImage
    var title: String
    
    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}
