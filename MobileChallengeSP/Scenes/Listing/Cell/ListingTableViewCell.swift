//
//  Listingcell.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 11/9/21.
//

import UIKit

final class ListingTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var ownerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureImageview()
    }
    
    private func configureImageview() {
        ownerImageView.layer.masksToBounds = true
        ownerImageView.clipsToBounds = true
        ownerImageView.layer.cornerRadius = ownerImageView.frame.size.width / 2
    }
    
    func configure(with viewModel: ListingRowViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.id.toString()
        ownerNameLabel.text = viewModel.owner.login
        guard let imageUrl = URL(string: viewModel.owner.avatarUrl) else { return }
        ownerImageView.setImage(with: imageUrl)
    }
}
