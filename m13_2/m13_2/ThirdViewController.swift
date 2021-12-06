import UIKit
<<<<<<< HEAD
// Создаем класс на основе расширенного класса FirstViewController
class ThirdViewController: FirstViewController {
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .orange
        title = "Третья вкладка: Первый экран"
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(SecondOfThirdViewController(), animated: true)
        }), for: .touchUpInside)
        view.addSubview(nextButton)
    }
}
// Создаем класс на основе расширенного класса FirstViewController
class SecondOfThirdViewController: FirstViewController {
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .orange
        title = "Третья вкладка: Второй экран"
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addAction(UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(ThirdOfThirdViewController(), animated: true)
        }), for: .touchUpInside)
        view.addSubview(nextButton)
    }
}
// Создаем класс на основе расширенного класса FirstViewController
class ThirdOfThirdViewController: FirstViewController {
    override func viewDidLayoutSubviews() {
        view.backgroundColor = .orange
        title = "Третья вкладка: Третий экран"
    }
    override func setupViews() {
        nextButton.setTitle("Дальше", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addTarget(self, action: #selector(doAlert), for: .touchUpInside)
        view.addSubview(nextButton)
=======

class ThirdViewController: ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Третья вкладка: Первый экран"
    }
    
}
class SecondOfThirdViewController: ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Третья вкладка: Второй экран"
        setupViews()
        setupConstraints()
    }
}
class ThirdOfThirdViewController: ViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Третья вкладка: Третья экран"
        setupViews()
        setupConstraints()
>>>>>>> 3baeaa6ff37d7bf042d0fde411197d6685af3507
    }
}
