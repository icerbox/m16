import UIKit

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
    }
}

