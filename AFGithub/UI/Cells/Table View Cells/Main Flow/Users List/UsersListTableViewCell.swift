//
//  UsersListTableViewCell.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 02.12.2021..
//

import UIKit

class UsersListTableViewCell: UITableViewCell {
	//MARK: Outlets
	@IBOutlet weak var cellBackgroundView: UIView!
	@IBOutlet weak var imgAvatar: UIImageView!
	@IBOutlet weak var lblUsername: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension UsersListTableViewCell {
	func setupLayout() {
		cellBackgroundView.roundViewDefault(backgroundColor: .tableViewCellBackgroundPrimary)

		lblUsername.font = .tableViewLabelPrimary
		lblUsername.textColor = .tableViewCellLabelTextPrimary
		lblUsername.text = "Username"

		imgAvatar.image = UIImage(systemName: "face.smiling")
	}
}
