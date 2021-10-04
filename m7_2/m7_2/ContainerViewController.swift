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
    
//    var isChecked = true
        
    @IBAction func Button1(_ sender: UIButton) {
        // Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать контроллеры 1 и 2
        if UiView3.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 1
            case 1:
                UiView1.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 1
                UiView1.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    // Все то же самое для второй кнопки
    @IBAction func Button2(_ sender: UIButton) {
        sender.tag += 1
        if UiView3.isHidden {
            if sender.tag > 1 { sender.tag = 0 }
            switch sender.tag {
            case 1:
                UiView2.isHidden = true
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                UiView2.isHidden = false
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    // Кнопка для включения/выключения контроллера заглушки
    @IBAction func Button3(_ sender: UIButton) {
        sender.tag += 1
        // Третьей кнопкой можно воспользоваться только если оба контроллера 1 и 2 выключены.
        if UiView1.isHidden && UiView2.isHidden {
            if sender.tag > 1 { sender.tag = 0 }
            switch sender.tag {
            case 1:
                UiView3.isHidden = true
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                UiView3.isHidden = false
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBOutlet weak var UiView1: UIView!
    
    @IBOutlet weak var UiView2: UIView!
    @IBOutlet weak var UiView3: UIView!
}

