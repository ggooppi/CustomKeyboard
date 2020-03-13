//
//  NameTableViewCell.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import UIKit

protocol NameCellDelegate: class {
    func toggleButton(buttonState: Bool, cellData: NameCellData)
}

class NameTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addSwitch: UISwitch!
    
    weak var nameCelldelegate: NameCellDelegate?
    private var nameDetail: NameCellData?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data: NameCellData) {
        nameDetail = data
        nameLabel.text = data.name
        addSwitch.isOn = data.isPersisted
        
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        guard let delegate = nameCelldelegate else { return }
        guard let selectedRowData = nameDetail else { return }
        delegate.toggleButton(buttonState: sender.isOn, cellData: selectedRowData)
    }
    
}
