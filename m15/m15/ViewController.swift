import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // Указываем идентификатор кастомной ячейки

    let customTableViewCell = "customTableViewCell"
    
    // Объявляем тэйблвью
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    // После загрузки вью в память выполняем следующие действия
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // регистрируем нашу кастомную ячейку
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customTableViewCell")
        // устанавливаем высоту ячейки
        self.tableView.rowHeight = 100
        // указываем источник даты
        tableView.dataSource = self
        // указываем делегата
        tableView.delegate = self
        // добавляем тэйблвью
        setupViews()
        // устанавливаем констрейнты
        setupConstraints()
    }
    
    // MARK: - Private
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    // Констрейнты тэйблвью устанавливаем при помощи SnapKit
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
}
// MARK: - Extensions

extension ViewController: UITableViewDataSource {
    
    // Указываем количество ячеек равным количеству элементов в массиве data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    // Настраиваем ячейки для тэйблвью
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // инициализируем кастомную ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCell) as? CustomTableViewCell
        // объявляем вьюмодель равной элементам массива data
        let viewModel = data[indexPath.row]
        // настраиваем вьюмодель
        cell?.configure(viewModel)
        // возвращаем ячейки
        return cell ?? UITableViewCell()
    }
}
extension ViewController: UITableViewDelegate {}
