//
//  ResultsViewController.swift
//  Shamir
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var p: Int?
    var ca: Int?
    var cb: Int?
    var m: Int?
    
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var dbLabel: UILabel!
    @IBOutlet weak var x1Label: UILabel!
    @IBOutlet weak var x2Label: UILabel!
    @IBOutlet weak var x3Label: UILabel!
    @IBOutlet weak var x4Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let ca = ca, let p = p, let cb = cb, let m = m {
            let ann = ShamirAbonent(c: ca, p: p)
            let bob = ShamirAbonent(c: cb, p: p)
            
            daLabel.text = String(ann.d!)
            dbLabel.text = String(bob.d!)
            
            let x1 = ann.code(m: m, byModule: p)
            let x2 = bob.code(m: x1, byModule: p)
            let x3 = ann.decode(m: x2, byModule: p)
            let x4 = bob.decode(m: x3, byModule: p)
            
            x1Label.text = "\(x1)"
            x2Label.text = "\(x2)"
            x3Label.text = "\(x3)"
            x4Label.text = "\(x4)"
        }
    }
}
