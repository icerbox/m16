//
//  ViewController.swift
//  m7_2
//
//  Created by icer on 22.09.2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func Button1(_ sender: UIButton) {
        // Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 1
            case 1:
                UiView1.isHidden = true
                // Меняем название кнопки на "OFF"
                let item = self.navigationItem.leftBarButtonItem!
                let button = item.customView as! UIButton
                button.setTitle("OFF", for: .normal)
                sender.tintColor = UIColor.red
            default:
                // При втором нажатии показываем контроллер 1
                UiView1.isHidden = false
                // Меняем название кнопки на "ON"
                let item = self.navigationItem.leftBarButtonItem!
                let button = item.customView as! UIButton
                button.setTitle("ON", for: .normal)
                sender.tintColor = UIColor.green
            }
        }
    }
    
    @IBAction func Button2(_ sender: UIButton) {
        //         Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 2
            case 1:
                UiView2.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 2
                UiView2.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBAction func Button3(_ sender: UIButton) {
        //         Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 3
            case 1:
                UiView3.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 3
                UiView3.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBAction func Button4(_ sender: UIButton) {
        //         Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 4
            case 1:
                UiView4.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 4
                UiView4.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBAction func Button5(_ sender: UIButton) {
        //         Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 5
            case 1:
                UiView5.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 5
                UiView5.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    @IBAction func Button6(_ sender: UIButton) {
        //         Для учета количества нажатий используем свойство tag. При каждом нажатии увеличиваем sender.tag на 1
        sender.tag += 1
        // Если контроллер загрушка выключен, то разрешаем пользователю включать/выключать остальные контроллеры
        if UiView7.isHidden {
            // Т.к. у наших кнопок только два действия включить и выключить, то если sender.tag больше 1 то обнуляем его
            if sender.tag > 1 { sender.tag = 0 }
            // используя конструкцию switch обрабатываем нажатия кнопки
            switch sender.tag {
            // При нажатии на кнопку 1 скрываем контроллер 6
            case 1:
                UiView6.isHidden = true
                // Меняем название кнопки на "OFF"
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            default:
                // При втором нажатии показываем контроллер 6
                UiView6.isHidden = false
                // Меняем название кнопки на "ON"
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            }
        }
    }
    
    @IBAction func Button7(_ sender: UIButton) {
        sender.tag += 1
        // Третьей кнопкой можно воспользоваться только если все другие контроллеры выключены.
        if UiView1.isHidden && UiView2.isHidden && UiView3.isHidden && UiView4.isHidden && UiView5.isHidden && UiView6.isHidden {
            if sender.tag > 1 { sender.tag = 0 }
            switch sender.tag {
            case 1:
                UiView7.isHidden = false
                sender.setTitle("ON", for: .normal)
                sender.setTitleColor(.green, for: .normal)
            default:
                UiView7.isHidden = true
                sender.setTitle("OFF", for: .normal)
                sender.setTitleColor(.red, for: .normal)
            }
        }
    }
    
    @IBOutlet weak var UiView1: UIView!
    @IBOutlet weak var UiView2: UIView!
    @IBOutlet weak var UiView3: UIView!
    @IBOutlet weak var UiView4: UIView!
    @IBOutlet weak var UiView5: UIView!
    @IBOutlet weak var UiView6: UIView!
    @IBOutlet weak var UiView7: UIView!
}

