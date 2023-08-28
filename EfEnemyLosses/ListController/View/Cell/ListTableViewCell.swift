//
//  ListTableViewCell.swift
//  EfEnemyLosses
//
//  Created by user on 26.08.2023.
//

import UIKit

class ListTableViewCell: UITableViewCell, ReusableCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var subNameLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }
    
    func configure(model: Equipment) {
        nameLabel.text = model.equipment ?? ""
        subNameLabel.text = model.model ?? ""
    }
}
