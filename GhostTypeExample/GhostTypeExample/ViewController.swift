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
        let ghostType = GhostTypeLabel(frame: CGRect(origin: .zero, size: CGSize(width: self.view.frame.width, height: 100.0)))
        ghostType.text = "Lorem ipsum tao mento lucas "
        self.view.addSubview(ghostType)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

