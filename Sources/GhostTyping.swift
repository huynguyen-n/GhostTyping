//
//  GhostType.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 7/5/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

//TODO: Add dummy view to solved selected action in UITextField
@IBDesignable
open class GhostTyping: UIView {
    
    //    MARK:- Private Variables
    private var textField: GhostTypingTextField!
    
    open var isLoop: Bool! {
        didSet {
            textField.isLoop = isLoop
        }
    }

    @IBInspectable
    open var text: String! {
        didSet {
            textField.text = text
        }
    }
    
    //    MARK:- Initialize
    public init(frame: CGRect, text: String, typeSpeed: Double) {
        
        super.init(frame: frame)
        textField = GhostTypingTextField(frame: frame, text: text, typeSpeed: typeSpeed)
        let view = UIView(frame: frame)
        view.backgroundColor = .clear
        self.addSubview(textField)
        self.insertSubview(view, aboveSubview: textField)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
