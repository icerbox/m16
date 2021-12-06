import UIKit

<<<<<<< HEAD
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
        print("viewDidLoad загружен")
    }
    // Устанавливаем атрибут @objc чтобы можно было его в дальнейшем переопределить из наследуемых классов ViewController'a
    @objc func setupViews() {
        print("setupViews")
        view.backgroundColor = .green
        title = "Первая вкладка: Первый экран"
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
    // Метод для создания и вывода tabBarController
    func setupTabBar() {
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
            // Объявляем массив с названиями изображений
            let images = ["1.circle.fill", "2.circle.fill", "3.circle.fill"]
            // Для каждой вкладки таббара устанавливаем изображения из массива images
            for i in 0..<items.count {
                items[i].image = UIImage(systemName: images[i])
            }
        tabBarController.modalPresentationStyle = .overCurrentContext
        self.view.window?.rootViewController?.present(tabBarController, animated: false, completion: nil)
        print("ТабБар загружен")
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
    
    // Перед отображением вью на экране, создаем сабвью для кнопки и устанавливаем констрейнты
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear загружен")
        super.viewWillAppear(animated)
        // Создаем вью для кнопки
        setupViews()
        // Устанавливаем констрейнты
        setupConstraints()
 
    }
    // После отображения вью на экране, выводим табБар
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTabBar()
    }
    // Срабатывает перед тем, как вью закроется
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    // Срабатывает после закрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
}
=======
class FirstViewController: ViewController {
    override func viewDidLoad() {
        setupViews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Первая вкладка: Первый экран"
    }
    override func setupViews() {
        nextButton.setTitle("Дальше из FirstViewController", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
//        nextButton.addAction(UIAction(handler: { [weak self] _ in
//            self?.navigationController?.pushViewController(SecondViewController(), animated: true)
//        }), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
        view.addSubview(nextButton)
    }
}
    
>>>>>>> 3baeaa6ff37d7bf042d0fde411197d6685af3507
