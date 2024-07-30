//
//  MovieDetailsTableViewCell.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 15/07/24.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    // MARK:Variable
    @IBOutlet weak var releasedDateLbl: UILabel!
    @IBOutlet weak var actorLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var movieTitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpMovieDeatils(deatilsMovie: MovieDetailsModel?) {
        posterImgView.sd_setImage(with: URL(string: deatilsMovie?.poster ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        movieTitleLbl.text = deatilsMovie?.title
        releasedDateLbl.text = deatilsMovie?.released
        actorLbl.text = deatilsMovie?.actors
        descriptionLbl.text = deatilsMovie?.genre
    }
}
