import UIKit

// Объявляем навигационный контроллер
class NavigationController: UINavigationController {
    
}

// Объявляем класс для таббарконтроллера
class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Объявляем экземпляр класса вьюконтроллера
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        // Создаем массив корневых вьюконтроллеров которые будет отображать наш таббар
        viewControllers = [
            // Для создания вкладки запускаем метод createTabBarItem
            createTabBarItem(title: "Задание 1", image: "1.square.fill", viewController: firstViewController),
            createTabBarItem(title: "Задание 2", image: "2.square.fill", viewController: secondViewController),
            createTabBarItem(title: "Задание 3", image: "3.square.fill", viewController: thirdViewController)
        ]
        // Объявляем метод createTabBarItem который на входе принимает значения "Название вкладки", "Название картинки", "Название вьюконтроллера"
        func createTabBarItem(title: String, image: String, viewController: UIViewController) -> UINavigationController {
            // Объявляем экземпляр класса NavigationController - navCont, у которого корневой вьюконтроллер берется из входного параметра viewController
            let navCont = NavigationController(rootViewController: viewController)
            // создаем вкладку при помощи свойства tabBarItem и присваиваем имя из параметра title
            navCont.tabBarItem.title = title
            // устанавливаем картинку для вкладки из параметра image
            navCont.tabBarItem.image = UIImage(systemName: image)
            // возвращаем созданный экземпляр класса UINavigationController
            return navCont
        }
    }
}

// Объявляем класс FirstViewController

class FirstViewController: UIViewController {
    // Объявляем константу firstCustomTableViewCell который будет использоваться как идентификатор
    let firstCustomTableViewCell = "firstCustomTableViewCell"
    // Объявляем ленивый экземпляр класса UITableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    // Объявляем массив countries который содержит тип данных FirstCustomTableViewCellViewModel
    let countries: [FirstCustomTableViewCellViewModel] = [
        FirstCustomTableViewCellViewModel(countryImages: Constants.Image.belgium ?? UIImage(),
            countryNames: "Belgium"
        ),
        FirstCustomTableViewCellViewModel(countryImages: Constants.Image.france ?? UIImage(),
            countryNames: "France"
        ),
        FirstCustomTableViewCellViewModel(countryImages: Constants.Image.germany ?? UIImage(),
            countryNames: "Germany"
        ),
        FirstCustomTableViewCellViewModel(countryImages: Constants.Image.greece ?? UIImage(),
            countryNames: "Greece"
        ),
        FirstCustomTableViewCellViewModel(countryImages: Constants.Image.austria ?? UIImage(),
            countryNames: "Austria")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Задание 1"
        // Do any additional setup after loading the view.
        tableView.register(FirstCustomTableViewCell.self, forCellReuseIdentifier: "firstCustomTableViewCell")
        self.tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }
    private func setupViews() {
        view.addSubview(tableView)
    }
    private func setupConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
            0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:
            0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:
            0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:
            0).isActive = true
    }
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: firstCustomTableViewCell) as? FirstCustomTableViewCell
        
        let viewModel = countries[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
}

extension FirstViewController: UITableViewDelegate {}



