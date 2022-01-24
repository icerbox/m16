import UIKit

class ThirdViewController: UIViewController {
    // Объявляем константу thirdCustomTableViewCell который будет использоваться как идентификатор
    let thirdCustomTableViewCell = "thirdCustomTableViewCell"
    // Объявляем ленивый экземпляр класса UITableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Задание 3"
        // Регистрируем tableView и присваиваем идентификатор
        tableView.register(ThirdCustomTableViewCell.self, forCellReuseIdentifier: "thirdCustomTableViewCell")
        self.tableView.rowHeight = 100
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

extension ThirdViewController: UITableViewDataSource {
    
    // Устанавливаем количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models2[section].name.count
        return models2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем экземпляр ячейки
        let cell = tableView.dequeueReusableCell(withIdentifier: thirdCustomTableViewCell) as? ThirdCustomTableViewCell
//        let datesModel = models2[indexPath.section]
//        cell?.configure(datesModel)
//        return cell ?? UITableViewCell()
        
        cell?.textLabel?.text = models2[indexPath.row].name
        return cell ?? UITableViewCell()
    }
}

extension ThirdViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = models2[indexPath.row]
//        let controller = PopViewController(items: ["description: \(category.description)", "location: \(category.location)"])
//        let controller = PopViewController(eventDescription: viewModel.description, eventLocation: viewModel.location)
        self.navigationController?.pushViewController(PopViewController(eventDescription: viewModel.description, eventLocation: viewModel.location), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}





