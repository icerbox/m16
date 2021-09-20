//
//  ViewController.swift
//  m7
//
//  Created by USER on 09.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupHeader()
        setupButton()
    }

    @IBAction func onButtonCPressed(_ sender: Any) {
        print("hello")
    }
    func setupHeader() {
        header.text = "Hello, Skillbox!"
    }
    func setupButton() {
        button.backgroundColor = .red
    }
}

