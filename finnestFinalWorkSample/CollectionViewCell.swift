//
//  CollectionViewCell.swift
//  finnestFinalWorkSample
//
//  Created by Dominick Hera on 10/12/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit

protocol CollectionViewCellDelegate: class {
    func flipCard(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backSideView: UIView!
    @IBOutlet weak var totalBalanceTitleLabel: UILabel!
    @IBOutlet weak var nestBalanceTitleLabel: UILabel!
    @IBOutlet weak var cardBalanceTitleLabel: UILabel!
    @IBOutlet weak var totalBalanceLabel: UILabel!
    @IBOutlet weak var nestBalanceLabel: UILabel!
    @IBOutlet weak var cardBalanceLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var childNameLabel: UILabel!
    var sideBoolVal: Bool = true
    var delegate: CollectionViewCellDelegate?
    
    var flipped: Bool = false {
        didSet {
            cellView.isHidden = !flipped
            backSideView.isHidden = flipped
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        flipped = true
        cellView.layer.cornerRadius = 14
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOpacity = 0.2
        cellView.layer.shadowOffset = CGSize(width: 0, height: 1)
        cellView.layer.masksToBounds = false
        
        backSideView.layer.cornerRadius = 14
        backSideView.layer.shadowColor = UIColor.gray.cgColor
        backSideView.layer.shadowOpacity = 0.2
        backSideView.layer.shadowOffset = CGSize(width: 0, height: 1)
        backSideView.layer.masksToBounds = false
    }
    
    func configureCell(child: Child) {
        self.sideBoolVal = child.sideBool
        self.childImageView.image =  UIImage(named: child.image)
        self.childImageView.layer.cornerRadius = self.childImageView.frame.size.width / 2
        self.childImageView.clipsToBounds = true
        self.childImageView.layer.borderWidth = 1.0
        self.childImageView.layer.borderColor = UIColor.black.cgColor
        self.childNameLabel.text = child.name
        self.totalBalanceLabel.text = "$\(child.totalWealth)"
        self.cardBalanceLabel.text = "$\(child.cardBalance)"
        self.nestBalanceLabel.text = "$\(child.nestBalance)"
    }

}
extension CollectionViewCell {
    func flipCard(_ sender: Any) {
        delegate?.flipCard(cell: self)
    }
}
