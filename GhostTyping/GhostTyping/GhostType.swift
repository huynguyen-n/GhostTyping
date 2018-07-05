//
//  GhostType.swift
//  GhostTyping
//
//  Created by Huy Nguyễn on 7/5/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit

@IBDesignable open class GhostType: UILabel {

    @IBInspectable open var charInterval: Double = 0.5
    
    open override var text: String? {
        get {
            return super.text
        }
        
        set {
            if charInterval < 0 {
                charInterval = -charInterval
            }
        }
    }
}
