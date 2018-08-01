//
//  GhostType.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 7/5/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

@IBDesignable
open class GhostType: UITextField {
    
    //    MARK:- Variables
    private var currDispatchId: Int = 320
    private let dispatchQueue = DispatchQueue(label: "com.br.GhostTyping")

    //    MARK:- IBInspectable
    
    //    Timer for each character displaying
    @IBInspectable open var charTimeInterval: Double = 0.1
    
    //    TODO: Custom cursor image
    @IBInspectable open var cursorImage: UIImage! {
        didSet {
            super.tintColor = UIColor(patternImage: cursorImage)
        }
    }
    
    @IBInspectable open var sizeOfCursor: CGSize = CGSize(width: 10.0, height: 2.0)
    
    //    MARK:- Initialize
    public init(frame: CGRect, text: String) {
        super.init(frame: frame)
        self.text = text
        initializeGhostType()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Initialize required")
    }
    
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
        newRect.origin.y = newRect.origin.y + newRect.size.height
        newRect.size = sizeOfCursor
        return newRect
    }
}



// MARK:- Private Functions
extension GhostType {
    
    fileprivate func initializeGhostType() {
        becomeFirstResponder()
        tintColor = textColor
    }
    
    fileprivate func startTyping(_ text: String, charTimeInterval: Double, _ initial: Bool, _ dispatchId: Int) {
        
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
                
                let nextString = String(text[firstChar...])
                
                self?.startTyping(nextString, charTimeInterval: charTimeInterval, false, dispatchId)
            })
        }
    }
}
