//
//  VenueListCell.swift
//  PhonePeMachineCodingRound
//
//  Created by Ankur  on 16/12/23.
//

import UIKit

class VenueListCell: UITableViewCell {

	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var thumbnailImageView: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		self.thumbnailImageView.clipsToBounds = true
		self.thumbnailImageView.layer.cornerRadius = 10.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	
	func setUp(with venue: Venue) {
		self.titleLabel.text = venue.name
		self.subtitleLabel.text = venue.extendedAddress
		// no url found in the api to load images
//		if let urlString = venue.url, let url = URL(string: urlString) {
//			self.thumbnailImageView.load(url : url)
//		}
	}
}
