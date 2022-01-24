import UIKit
import SwiftUI

class SecondViewController: UIViewController {
    // Объявляем константу secondCustomTableViewCell который будет использоваться как идентификатор
    let secondCustomTableViewCell = "secondCustomTableViewCell"
    // Объявляем ленивый экземпляр класса UITableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Задание 2"
        // Регистрируем tableView и присваиваем идентификатор
        tableView.register(SecondCustomTableViewCell.self, forCellReuseIdentifier: "secondCustomTableViewCell")
        self.tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
        setupDates()
    }
    
    private func setupDates() {
        // Объявляем экземпляр класса DateFormatter()
        let dateFormatter = DateFormatter()
        // Устанавливаем локаль
        dateFormatter.locale = Locale(identifier: "ru_RU")
        // Устанавливаем часовой пояс
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        // Устанавливаем формат даты
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        
        // Объявляем массив с типом данных Date и добавляем в нее сконвертированные данные со свойством publishedAt из массива models. Если получаем пустое значение возвращаем текущую дату
        datesFromModels = models.map { DatesRecordModel(title: ($0.title), publishedAt: dateFormatter.date(from: ($0.publishedAt)) ?? Date()) }
        
        // Устанавливаем формат даты
        dateFormatter.dateFormat = "dd-MM-yyyy"

        // На основе массива дат datesFromModels создаем словарь который разбивает массив по датам. В качестве ключа выступает дата, в качестве значения выступает массив элементов publishedAt
        
        let groupDic = Dictionary(grouping: datesFromModels, by: { (element: DatesRecordModel) -> Date in
            let components = Calendar.current.dateComponents([.day, .month, .year], from: element.publishedAt)
            let date = Calendar.current.date(from: components)
            return date ?? Date()
        })
        // Из
        datesFromDictionary = groupDic.map { DictionaryRecordModel(nameSection: dateFormatter.string(from: $0.key), cells: $0.value
            )}
        datesFromDictionary.sort {
            $0.nameSection > $1.nameSection
        }
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

extension SecondViewController: UITableViewDataSource {
    // Устанавливаем заголовок секции как значение nameSection
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return datesFromDictionary[section].nameSection
        }
    // Устанавливаем количество секций в таблице
    func numberOfSections(in tableView: UITableView) -> Int {
        return datesFromDictionary.count
    }
    // Устанавливаем количество ячеек в каждой секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesFromDictionary[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем экземпляр ячейки
        let cell = tableView.dequeueReusableCell(withIdentifier: secondCustomTableViewCell) as? SecondCustomTableViewCell
        
        let datesModel = datesFromDictionary[indexPath.section].cells[indexPath.row]
        
        cell?.configure(datesModel)
        return cell ?? UITableViewCell()
    }
}

extension SecondViewController: UITableViewDelegate {}
