//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    let dataClient: DataSourceClient = DataSourceClientImpl.shared
    
    var keyboardView: KeyboardView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        keyboardView = (objects.first as! KeyboardView)
        
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        keyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
        keyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
        keyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
        keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor)
        ])
        
        keyboardView.setNextKeyboardVisible(needsInputModeSwitchKey)
        keyboardView.nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
      let colorScheme: MorseColorScheme

      if textDocumentProxy.keyboardAppearance == .dark {
        colorScheme = .dark
      } else {
        colorScheme = .light
      }

      keyboardView.setColorScheme(colorScheme)
    }

}
