import UIKit
// Создаем класс на основе расширенного класса FirstViewController
class SecondViewController: FirstViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вкладка 2"
    }
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .yellow
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(SecondOfSecondViewController(), animated: true)
        }), for: .touchUpInside)
        view.addSubview(nextButton)
    }
}
// Создаем класс на основе расширенного класса FirstViewController
class SecondOfSecondViewController: FirstViewController {
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .yellow
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
        view.addSubview(nextButton)
    }
}

