//
//  DetailView.swift
//  MoviesApp
//
//  Created by Muhammad Hussain Baig on 31/08/2023.
//

import UIKit
import SDWebImage

class DetailView: UIViewController {
    
    @IBOutlet weak var ImgbackdropImage: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblOrignalLanguage: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblAdult: UILabel!
    @IBOutlet weak var lblGenreIDS: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    var backdropPath: String = "https://image.tmdb.org/t/p/original"
    var movieTitle: String?
    var originalLanguage: String?
    var popularity: String?
    var adult: String?
    var genreIDS: String?
    var id: String?
    var voteAverage: String?
    var voteCount: String?
    var overview: String?
    var releaseDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblMovieTitle.text = self.movieTitle
        self.lblOrignalLanguage.text = self.originalLanguage
        self.lblPopularity.text = self.popularity
        self.lblAdult.text = self.adult
        self.lblGenreIDS.text = self.genreIDS
        self.lblId.text = self.id
        self.lblVoteAverage.text = self.voteAverage
        self.lblVoteCount.text = self.voteCount
        self.lblOverview.text = self.overview
        self.lblReleaseDate.text = self.releaseDate
        
        let imgbackdropImage = URL(string:backdropPath ?? "" )
        self.ImgbackdropImage.sd_setImage(with: imgbackdropImage)
        self.ImgbackdropImage.layer.cornerRadius = 10
    }
    
    func setValues(result: Result) {
        self.backdropPath = backdropPath + result.backdropPath
        self.movieTitle = result.originalTitle
        self.originalLanguage = result.originalLanguage
        self.popularity = "\(result.popularity)"
        self.adult = "\(result.adult)"
        self.genreIDS = "\(result.genreIDS)"
        self.id = "\(result.id)"
        self.voteAverage = "\(result.voteAverage)"
        self.voteCount = "\(result.voteCount)"
        self.overview = result.overview
        self.releaseDate = result.releaseDate
    }
}
