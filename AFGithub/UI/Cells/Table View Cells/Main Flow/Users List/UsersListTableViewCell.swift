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
	func setupLayout(model: UsersListTableViewCellModel) {
		cellBackgroundView.roundViewDefault(backgroundColor: .tableViewCellBackgroundPrimary)

		lblUsername.font = .tableViewLabelPrimary
		lblUsername.textColor = .tableViewCellLabelTextPrimary
		lblUsername.text = model.username

		guard let imageURL = URL(string: model.avatarImageUrl) else { return }
		DispatchQueue.global().async {
			guard let imageData = try? Data(contentsOf: imageURL) else { return }
			let image = UIImage(data: imageData)
			DispatchQueue.main.async {
				self.imgAvatar.image = image
			}
		}
	}
}
