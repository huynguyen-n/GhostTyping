//
//  GhostType.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 7/5/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

@IBDesignable open class GhostTypeLabel: UITextField, UITextFieldDelegate {

    //    MARK:- IBInspactable Variables
    @IBInspectable open var charTimeInterval: Double = 0.1
    @IBInspectable open var cursorImage: UIImage! {
        didSet {
            super.tintColor = UIColor(patternImage: cursorImage)
        }
    }
    @IBInspectable open var sizeOfCursor: Double = 0.0
    
    //    MARK:- Private Variables
    private var currDispatchId: Int = 320
    private let dispatchQueue = DispatchQueue(label: "com.br.GhostTyping")
    
    //    MARK:- Overrides
    open override var text: String! {
        get {
            return super.text
        }
        
        set {
            if charTimeInterval < 0 {
                charTimeInterval = -charTimeInterval
            }
            
            startTyping(newValue, charTimeInterval: charTimeInterval, true, currDispatchId)
        }
    }
    
    /// Function to resize the cursor
    ///
    /// - Parameter position: Current cursor postion
    /// - Returns: Coordinate of position
    
    //    TODO: calculate size of the cursor image
    open override func caretRect(for position: UITextPosition) -> CGRect {
        var newRect = super.caretRect(for: position)
        newRect.size = CGSize(width: sizeOfCursor, height: sizeOfCursor)
        return newRect
    }
}

// MARK:- Private Functions
extension GhostTypeLabel {
    
    private func startTyping(_ text: String, charTimeInterval: Double, _ initial: Bool, _ dispatchId: Int) {
        
        guard text.count > 0 && currDispatchId == dispatchId else {
            return
        }
        
        if initial {
            
            super.text = ""
            
        }
        
        let firstChar = text.index(text.startIndex, offsetBy: 1)
        
        DispatchQueue.main.async {
            super.text = super.text! + String(text[..<firstChar])
            
            self.dispatchQueue.asyncAfter(deadline: .now() + charTimeInterval, execute: { [weak self] in
                
                guard let `self` = self else { return }
                
                let nextString = String(text[firstChar...])
                
                self.startTyping(nextString, charTimeInterval: charTimeInterval, false, dispatchId)
            })
        }
    }
}
