//
//  Listingcell.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 14.4.22
//

import UIKit
import Extensions
import Foundation

final class ListingTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ownerNameLabel: UILabel!
    @IBOutlet private weak var detailsLabel: UILabel!
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet weak var detailsView: UIView!
    
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
        ownerNameLabel.text = viewModel.owner.login
        detailsLabel.text = viewModel.score
        guard let imgUrl = URL(string: viewModel.owner.avatarUrl) else { return }
        ownerImageView.setImage(with: imgUrl)
        detailsView.isHidden = viewModel.rowState == .normal
    }
}
