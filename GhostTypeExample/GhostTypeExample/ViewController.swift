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
        let text = "Lorem ipsum tao mento lucas"
        let ghostType = GhostTypeView(frame: frame, text: text)
        self.view.addSubview(ghostType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

