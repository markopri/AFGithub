//
//  RepositoryDetailsTableViewCell.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import UIKit

class RepositoryDetailsTableViewCell: UITableViewCell {
	//MARK: Outlets
	@IBOutlet weak var cellBackgroundView: UIView!
	@IBOutlet weak var lblContent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension RepositoryDetailsTableViewCell {
	func setupLayout(model: RepositoryDetailsTableViewCellModel) {
		cellBackgroundView.roundViewDefault(backgroundColor: .tableViewCellBackgroundPrimary)

		lblContent.font = .tableViewLabelSecondary
		lblContent.textColor = .tableViewCellLabelTextPrimary
		lblContent.text = model.content
	}
}
