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

    @IBOutlet weak var ghostTypingView: GhostTyping! {
        didSet {
            self.lazyInitGhostTypingView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func lazyInitGhostTypingView() {
        
//        let frame = self.ghostTypingView.frame
//        let text = "Hello guys, my name is: "
//        let ghostTyping = GhostTyping(frame: frame, text: text, typeSpeed: 0.1)
//        ghostTyping.isLoop = true
//        self.ghostTypingView.addSubview(ghostTyping)
    }
}

