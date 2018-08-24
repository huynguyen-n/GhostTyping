//
//  GhostTypeTextField.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 8/1/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

class GhostTypingTextField: UITextField {
    
    //    MARK:- Private Variables
    fileprivate var currDispatchId: Int = 320
    fileprivate let dispatchQueue = DispatchQueue(label: "com.br.GhostTyping")
    fileprivate var typeSpeed: Double = 0.0
    fileprivate var tempStoreText = ""
    fileprivate var sizeOfCursor: CGSize = CGSize(width: 10.0, height: 2.0)
    fileprivate var loopString = ""
    
    //    MARK:- Public Variables
    open var isLoop: Bool = false
    
    open var strings: [String] = [String]()
    
    //    TODO: Custom cursor image
    open var cursorImage: UIImage! {
        didSet {
            super.tintColor = UIColor(patternImage: cursorImage)
        }
    }
    
    //    MARK:- Initialize
    init(frame: CGRect, text: String, typeSpeed: Double) {
        super.init(frame: frame)
        self.text = text
        self.typeSpeed = typeSpeed
        initializeGhostTyping()
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
    
    var count = 0
}



// MARK:- Private Functions
extension GhostTypingTextField {
    
    fileprivate func initializeGhostTyping() {
        becomeFirstResponder()
        tintColor = textColor
        startType()
    }
    
    fileprivate func startType() {
        if typeSpeed < 0 {
            typeSpeed = -typeSpeed
        }
        
        if strings.count > 0 {
            self.isLoop = true
            self.gtTyping(self.text + strings.first!, typeSpeed: typeSpeed, true, currDispatchId)
        } else {
            self.gtTyping(self.text, typeSpeed: typeSpeed, true, currDispatchId)
        }
    }
    
    fileprivate func gtLoopAll() {
        self.tempStoreText = self.text
        self.text = ""
        self.gtTyping(self.tempStoreText, typeSpeed: self.typeSpeed, true, self.currDispatchId)
    }
    
    fileprivate func gtLoopSmartBackspace(_ index: Int) {
        let textAtIndex = self.strings[index]
        self.tempStoreText = self.text.replacingOccurrences(of: textAtIndex, with: "")
        self.loopString.forEach { _ in self.deleteBackward() }
        self.loopString = textAtIndex
        self.gtTyping(self.loopString, typeSpeed: self.typeSpeed, false, self.currDispatchId)
    }
    
    
    fileprivate func gtDeleteBackward(_ params: (smartBackspace: Bool, index: Int)? = nil ) {
        DispatchQueue.main.async {
            if let params = params {
                self.gtLoopSmartBackspace(params.index)
            } else {
                self.gtLoopAll()
            }
        }
    }
    
    fileprivate func gtTyping(_ text: String, typeSpeed: Double, _ initial: Bool, _ dispatchId: Int) {
        
        guard text.count > 0 && currDispatchId == dispatchId else {
            return
        }
        
        if initial {
            
            super.text = ""
            
        }
        
        let firstChar = text.index(text.startIndex, offsetBy: 1)
        
        DispatchQueue.main.async {
            
            if !self.loopString.isEmpty {
                super.text! += String(text[..<firstChar])
            } else {
                super.text = super.text! + String(text[..<firstChar])
            }
            
            self.dispatchQueue.asyncAfter(deadline: .now() + typeSpeed, execute: { [weak self] in
                
                guard let `self` = self else { return }
                
                let nextString = String(text[firstChar...])
                
                if nextString.isEmpty && self.isLoop && self.strings.count == 0 {
                    self.gtDeleteBackward()
                } else if nextString.isEmpty && self.isLoop && self.strings.count > 0 {
                    let params: (smartBackspace: Bool, index: Int) = (true, self.strings.index(of: text) ?? 0)
                    self.gtDeleteBackward(params)
                } else {
                    self.gtTyping(nextString, typeSpeed: typeSpeed, false, dispatchId)
                }
            })
        }
    }
}
