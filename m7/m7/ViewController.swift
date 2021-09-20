//
//  ViewController.swift
//  m7
//
//  Created by IceR on 14.09.2021.
//  Copyright © 2021 Skillbox. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var clicks = 0 // Объявляем счетчик кликов по кнопке и присваиваем 0
    @IBOutlet weak var Click: UIButton!
    @IBOutlet weak var LabelText: UILabel!
    @IBAction func Click(_ sender: UIButton) {
        clicks += 1 // При каждом клике увеличиваем счетчик на +1
        LabelText.text = "Нажатий: \(clicks)" // Выводим значение счетчика в лейбл
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Click.backgroundColor = UIColor(red: 0.61, green: 0.98, blue: 0.97, alpha: 1.00) // Через конвертер uicolor.io меняем цвет hex-формата #9bfaf8 на UIColor
    }
}

