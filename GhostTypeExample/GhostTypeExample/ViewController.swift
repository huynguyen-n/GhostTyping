//
//  ViewController.swift
//  GhostTypeExample
//
//  Created by Huy Nguyễn on 7/5/18.
//  Copyright © 2018 Huy Nguyễn. All rights reserved.
//

import UIKit
import GhostTyping

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let frame = CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 100.0))
        let text = "Hello guys, my name is: "
        let ghostType = GhostType(frame: frame, text: text, typeSpeed: 0.1)
        ghostType.isLoop = true
        self.view.addSubview(ghostType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

