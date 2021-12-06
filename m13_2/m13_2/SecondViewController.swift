import UIKit
<<<<<<< HEAD
// Создаем класс на основе расширенного класса FirstViewController
class SecondViewController: FirstViewController {
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .yellow
        title = "Вторая вкладка: Первый экран"
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
        title = "Вторая вкладка: Второй экран"
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
        view.addSubview(nextButton)
=======

class SecondViewController: ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Вторая вкладка: Первый экран"
    }
    
}
class SecondOfSecondViewCOntroller: ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Вторая вкладка: Второй экран"
        setupViews()
        setupConstraints()
>>>>>>> 3baeaa6ff37d7bf042d0fde411197d6685af3507
    }
}

