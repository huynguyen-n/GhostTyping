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
        
        let frame = CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 100.0))
        let text = "Hello guys, my name is: "
        let ghostTypingView = GhostTyping(frame: frame, text: text, typeSpeed: 0.1)
        ghostTypingView.isLoop = true
        self.view.addSubview(ghostTypingView)
    }
}

