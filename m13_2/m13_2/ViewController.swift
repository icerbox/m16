import UIKit

class ViewController: UIViewController {
    var nextButton = UIButton()
}

extension ViewController {
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    @objc func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(ViewController(), animated: true)
        }), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    @objc func doAlert(sender: UIButton!) {
            // Создаем экземпляр класса UIAlertController
            let lastPageAlert = UIAlertController(title: "Это последняя страница", message: "Вы хотите вернуться назад?", preferredStyle: UIAlertController.Style.alert)
            lastPageAlert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction!) in
                // Если пользователь выбирает вариант "Да", то открываем первую страницу таббарконтроллера
                self.tabBarController?.selectedIndex = 0
            }))
            lastPageAlert.addAction(UIAlertAction(title: "Остаться", style: .cancel, handler: { (action: UIAlertAction!) in
                // в противном случае выводим сообщение в консоль и ничего не предпринимаем
                print("Остаемся на текущем экране")
            }))
            // запускаем предупреждение
            present(lastPageAlert, animated: true, completion: nil)
        }
    override func viewDidAppear(_ animated: Bool) {
        // Создаем и выводим tabBarController
        let tabBarController = UITabBarController()

        let firstViewController = UINavigationController(rootViewController: FirstViewController())
        let secondViewController = UINavigationController(rootViewController: SecondViewController())
        let thirdViewController = UINavigationController(rootViewController: ThirdViewController())

        firstViewController.title = "Вкладка 1"
        secondViewController.title = "Вкладка 2"
        thirdViewController.title = "Вкладка 3"

        tabBarController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: false)

        guard let items = tabBarController.tabBar.items else {
            return
        }
            let images = ["1.circle.fill", "2.circle.fill", "3.circle.fill"]
            for x in 0..<items.count {
                items[x].image = UIImage(systemName: images[x])
            }
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: false)
    }
    
}
