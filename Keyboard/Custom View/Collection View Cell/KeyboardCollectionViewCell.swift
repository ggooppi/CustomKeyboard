//
//  KeyboardCollectionViewCell.swift
//  Keyboard
//
//  Created by gopinath.a on 14/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import UIKit

protocol KeyboardCollectionViewCellDelegate: class {
  func insertCharacter(_ newCharacter: String)
}

class KeyboardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameButton: KeyboardButton!
    weak var delegate: KeyboardCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonOnClick(_ sender: UIButton) {
        delegate?.insertCharacter(sender.titleLabel?.text ?? "")
    }
}
