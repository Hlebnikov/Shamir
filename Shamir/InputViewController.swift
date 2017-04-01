//
//  InputViewController.swift
//  Shamir
//
//  Created by Александр on 01.04.17.
//  Copyright © 2017 IceRockDev. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var pTextField: UITextField!
    @IBOutlet weak var caTextField: UITextField!
    @IBOutlet weak var cbTextField: UITextField!
    @IBOutlet weak var mTextField: UITextField!
    
    @IBAction func onCalc(_ sender: Any) {
        performSegue(withIdentifier: "toResults", sender: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ResultsViewController {
            nextVC.p = Int(pTextField.text!)!
            nextVC.ca = Int(caTextField.text!)!
            nextVC.cb = Int(cbTextField.text!)!
            nextVC.m = Int(mTextField.text!)!
        }
    }
 

}
