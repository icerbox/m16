import UIKit

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
    }
}
