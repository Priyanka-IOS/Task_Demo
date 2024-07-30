//
//  MoviesTableViewCell.swift
//  Task_Demo
//
//  Created by Priyanka Ghosh on 14/07/24.
//

import UIKit
import SDWebImage

class MoviesTableViewCell: UITableViewCell {
    // MARK:Variable
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var posterImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpMoviesData(moviesData:MoviesDataModel?) {
        titleLbl.text = moviesData?.title
        releaseDateLbl.text = moviesData?.year
        posterImgView.sd_setImage(with: URL(string: moviesData?.poster ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        favBtn.isHidden = true
    }
}
