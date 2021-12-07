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
            createTabBarItem(title: "Вкладка 1", image: "1.circle.fill", viewController: firstViewController),
            createTabBarItem(title: "Вкладка 2", image: "2.circle.fill", viewController: secondViewController),
            createTabBarItem(title: "Вкладка 3", image: "3.circle.fill", viewController: thirdViewController)
        ]
        func createTabBarItem(title: String, image: String, viewController: FirstViewController) -> UINavigationController {
            // объявляем константу navCont которой назначаем вьюконтроллер FirstViewController обернутый в навигационный контроллер MainController
            let navCont = NavigationController(rootViewController: viewController)
            navCont.tabBarItem.title = title
            navCont.tabBarItem.image = UIImage(systemName: image)
            return navCont
        }
    }
}

// Объявляем основной вьюконтроллер FirstViewController
class FirstViewController: UIViewController {
    // Объявляем переменную для кнопки
    var nextButton = UIButton()
}

// Делаем расширение ViewController'a
extension FirstViewController {
    // Срабатывает после загрузки View в память
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вкладка 1"
        // Создаем вью для кнопки
        setupViews()
        // Устанавливаем констрейнты
        setupConstraints()
        print("viewDidLoad загружен")
    }
    // Устанавливаем атрибут @objc чтобы можно было его в дальнейшем переопределить из наследуемых классов ViewController'a
    @objc func setupViews() {
        view.backgroundColor = .green
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
        view.addSubview(nextButton)
        print("setupViews запущен")
    }
    func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        print("setupConstraints запущен")
    }
    
    // Объявляем метод для вывода Сообщения для перехода на первую страницу
    @objc func doAlert(sender: UIButton!) {
            // Создаем экземпляр класса UIAlertController
            let lastPageAlert = UIAlertController(title: "Это последняя страница", message: "Вы хотите вернуться назад?", preferredStyle: UIAlertController.Style.alert)
            lastPageAlert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction!) in
                // Если пользователь выбирает вариант "Да", то открываем первую страницу таббарконтроллера
                self.navigationController?.popToRootViewController(animated: true)
            }))
            lastPageAlert.addAction(UIAlertAction(title: "Остаться", style: .cancel, handler: { (action: UIAlertAction!) in
                // в противном случае выводим сообщение в консоль и ничего не предпринимаем
                print("Остаемся на текущем экране")
            }))
            // запускаем предупреждение
            present(lastPageAlert, animated: true, completion: nil)
        }
}
