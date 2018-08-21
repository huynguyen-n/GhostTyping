//
//  ViewController.swift
//  GhostTypingExample
//
//  Created by Huy Nguyễn on 8/7/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit
import GhostTyping

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lazyInitGhostTypingView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func lazyInitGhostTypingView() {
        let frame = CGRect(origin: .zero, size: self.view.frame.size)
        let text = "Hello guys, my name is: "
        let ghostTyping = GhostTyping(frame: frame, text: text, typeSpeed: 0.1)
        ghostTyping.isLoop = true
        ghostTyping.strings = ["Ghost Cut", "Dog Ghost"]
        self.view.addSubview(ghostTyping)
    }
}

