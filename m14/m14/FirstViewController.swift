//
//  ViewController.swift
//  m14
//
//  Created by Андрей Антонен on 13.12.2021.
//

import UIKit

// Объявляем навигационный контроллер
class NavigationController: UINavigationController {
    
}

// Объявляем класс для таббарконтроллера
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        
        viewControllers = [
            createTabBarItem(title: "Задание 1", image: "", viewController: firstViewController),
            createTabBarItem(title: "Задание 2", image: "", viewController: secondViewController),
            createTabBarItem(title: "Задание 3", image: "", viewController: thirdViewController)
        ]
        func createTabBarItem(title: String, image: String, viewController: FirstViewController) -> UINavigationController {
            let navCont = NavigationController(rootViewController: viewController)
            navCont.tabBarItem.title = title
            navCont.tabBarItem.image = UIImage(systemName: image)
            return navCont
        }
    }
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Задание 1"
        // Do any additional setup after loading the view.
    }


}

