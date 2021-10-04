//
//  ViewController.swift
//  m7_2
//
//  Created by user on 22.09.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var isChecked = true
    
    
    @IBAction func Button1(_ sender: UIButton) {
        if isChecked {
            UiView1.isHidden = true
            sender.setTitle("ON", for: .normal)
            sender.setTitleColor(.green, for: .normal)
        } else {
            UiView1.isHidden = false
            sender.setTitle("OFF", for: .normal)
            sender.setTitleColor(.red, for: .normal)
        }
    }
    
    @IBAction func Button2(_ sender: UIButton) {
    }
    
    @IBAction func Button3(_ sender: UIButton) {
    }
    @IBOutlet weak var UiView1: UIView!
    
    @IBOutlet weak var UiView2: UIView!
}

