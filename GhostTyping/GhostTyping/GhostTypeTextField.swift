//
//  GhostTypeTextField.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 8/1/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

class GhostTypeTextField: UITextField {
    
    //    MARK:- Variables
    private var currDispatchId: Int = 320
    private let dispatchQueue = DispatchQueue(label: "com.br.GhostTyping")
    
    //    MARK:- IBInspectable
    
    // Speed of display character from text
    fileprivate var typeSpeed: Double = 0.0
    
    fileprivate var tempStoreText = ""
    
    open var isLoop: Bool = false
    
    //    TODO: Custom cursor image
    var cursorImage: UIImage! {
        didSet {
            super.tintColor = UIColor(patternImage: cursorImage)
        }
    }
    
    //    Resize size of cursor, currenlty is splash
    private var sizeOfCursor: CGSize = CGSize(width: 10.0, height: 2.0)
    
    //    MARK:- Initialize
    init(frame: CGRect, text: String, typeSpeed: Double) {
        super.init(frame: frame)
        self.text = text
        self.typeSpeed = typeSpeed
        initializeGhostType()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK:- Overrides
    open override var text: String! {
        get {
            return super.text
        }
        set {
            super.text = newValue
        }
    }
    
    //    Hidden keyboard view set default value
    open override var inputView: UIView? {
        get {
            return UIView()
        }
        set {
            super.inputView = newValue
        }
    }
    
    /// Function to resize the cursor
    ///
    /// - Parameter position: Current cursor postion
    /// - Returns: Coordinate of position
    
    //    TODO: calculate size of the cursor image
    open override func caretRect(for position: UITextPosition) -> CGRect {
        var newRect = super.caretRect(for: position)
        newRect.origin.y = newRect.origin.y + newRect.size.height - sizeOfCursor.height
        newRect.size = sizeOfCursor
        return newRect
    }
}



// MARK:- Private Functions
extension GhostTypeTextField {
    
    fileprivate func initializeGhostType() {
        becomeFirstResponder()
        tintColor = textColor
        startType()
    }
    
    fileprivate func startType() {
        if typeSpeed < 0 {
            typeSpeed = -typeSpeed
        }
        
        recursiveTyping(self.text, typeSpeed: typeSpeed, true, currDispatchId)
    }
    
    fileprivate func customDeleteBackward() {
        DispatchQueue.main.async {
            self.tempStoreText = self.text
            self.text = ""
            self.recursiveTyping(self.tempStoreText, typeSpeed: self.typeSpeed, true, self.currDispatchId)
        }
    }
    
    fileprivate func recursiveTyping(_ text: String, typeSpeed: Double, _ initial: Bool, _ dispatchId: Int) {
        
        guard text.count > 0 && currDispatchId == dispatchId else {
            return
        }
        
        if initial {
            
            super.text = ""
            
        }
        
        let firstChar = text.index(text.startIndex, offsetBy: 1)
        
        DispatchQueue.main.async {
            
            super.text = super.text! + String(text[..<firstChar])
            
            self.dispatchQueue.asyncAfter(deadline: .now() + typeSpeed, execute: { [weak self] in
                
                guard let `self` = self else { return }
                
                let nextString = String(text[firstChar...])
                
                if nextString.isEmpty && self.isLoop {
                    self.customDeleteBackward()
                }
                
                self.recursiveTyping(nextString, typeSpeed: typeSpeed, false, dispatchId)
            })
        }
    }
}
