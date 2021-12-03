import UIKit

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
    
