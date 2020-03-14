//
//  KeyboardView.swift
//  Keyboard
//
//  Created by gopinath.a on 14/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import UIKit


protocol KeyboardViewDelegate: class {
  func insertCharacter(_ newCharacter: String)
  func deleteCharacterBeforeCursor()
  func characterBeforeCursor() -> String?
}

class KeyboardView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spaceButton: KeyboardButton!
    @IBOutlet weak var nextButton: KeyboardButton!
    @IBOutlet weak var backSpaceButton: KeyboardButton!
    
    private var names = [String]()
    
    weak var delegate: KeyboardViewDelegate?
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setColorScheme(.light)
        setNextKeyboardVisible(false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setColorScheme(.light)
        setNextKeyboardVisible(false)
        collectionView.register(UINib(nibName: "KeyboardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "keyboardCollectionViewCell")
    }
    
    func setNextKeyboardVisible(_ visible: Bool) {
        nextButton.isHidden = !visible
    }
    
    func setColorScheme(_ colorScheme: MorseColorScheme) {
        let colorScheme = MorseColors(colorScheme: colorScheme)
        backgroundColor = colorScheme.backgroundColor
        
        for view in subviews {
            if let button = view as? KeyboardButton {
                button.setTitleColor(colorScheme.buttonTextColor, for: [])
                button.tintColor = colorScheme.buttonTextColor
                
                if button == nextButton || button == backSpaceButton {
                    button.defaultBackgroundColor = colorScheme.buttonHighlightColor
                    button.highlightBackgroundColor = colorScheme.buttonBackgroundColor
                } else {
                    button.defaultBackgroundColor = colorScheme.buttonBackgroundColor
                    button.highlightBackgroundColor = colorScheme.buttonHighlightColor
                }
            }
        }
    }
    
    func setup(names: [String]) {
        self.names = names
        collectionView.reloadData()
    }
    
    @IBAction func spaceButtonOnClick(_ sender: Any) {
        delegate?.insertCharacter(" ")
    }
    
    @IBAction func deleteButtonOnCLlck(_ sender: Any) {
        delegate?.deleteCharacterBeforeCursor()
    }
    
}

extension KeyboardView : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "keyboardCollectionViewCell", for: indexPath) as! KeyboardCollectionViewCell
        cell.nameButton.setTitle(names[indexPath.row], for: .normal)
        cell.delegate = self
        return cell
    }
    
}

extension KeyboardView: KeyboardCollectionViewCellDelegate{
    func insertCharacter(_ newCharacter: String) {
        delegate?.insertCharacter(newCharacter)
    }
}

