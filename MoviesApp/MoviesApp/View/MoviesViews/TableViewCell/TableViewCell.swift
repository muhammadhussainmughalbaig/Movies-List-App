//
//  TableViewCell.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 30/08/2023.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblOrignalLanguage: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!

    let baseImageURL: String = "https://image.tmdb.org/t/p/original"
    
    func setValues(result: Result) {
        let posterImageURL = URL(string:baseImageURL+result.posterPath )
        self.posterImage.sd_setImage(with: posterImageURL)
        self.lblMovieName.text = result.title
        self.lblOrignalLanguage.text = result.originalLanguage
        lblPopularity.text = "\(result.popularity)"
        self.posterImage.layer.cornerRadius = 10
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    deinit {
        print("TableViewCell class deinitialized")
    }
}
