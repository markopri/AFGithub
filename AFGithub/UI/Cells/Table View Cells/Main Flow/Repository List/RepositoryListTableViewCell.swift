//
//  RepositoryListTableViewCell.swift
//  AFGithub
//
//  Created by Marko Koprivnjak on 03.12.2021..
//

import UIKit

class RepositoryListTableViewCell: UITableViewCell {
	//MARK: Outlets
	@IBOutlet weak var cellBackgroundView: UIView!
	@IBOutlet weak var lblTitle: UILabel!
	@IBOutlet weak var lblLanguage: UILabel!
	@IBOutlet weak var lblCreated: UILabel!
	@IBOutlet weak var lblWatchers: UILabel!
	@IBOutlet weak var lblIssues: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension RepositoryListTableViewCell {
	func setupLayout(model: RepositoryListTableViewCellModel) {
		cellBackgroundView.roundViewDefault(backgroundColor: .tableViewCellBackgroundPrimary)

		lblTitle.font = .tableViewLabelPrimary
		lblLanguage.font = .tableViewLabelSecondary
		lblCreated.font = .tableViewLabelSecondary
		lblWatchers.font = .tableViewLabelSecondary
		lblIssues.font = .tableViewLabelSecondary

		lblTitle.textColor = .tableViewCellLabelTextPrimary
		lblLanguage.textColor = .tableViewCellLabelTextPrimary
		lblCreated.textColor = .tableViewCellLabelTextPrimary
		lblWatchers.textColor = .tableViewCellLabelTextPrimary
		lblIssues.textColor = .tableViewCellLabelTextPrimary

		lblTitle.text = model.name
		lblLanguage.text = model.language
		lblCreated.text = model.created.formatServerDate()
		lblWatchers.text = "Watchers: \(model.watchers)"
		lblIssues.text = "Issues: \(model.issues)"
	}
}
