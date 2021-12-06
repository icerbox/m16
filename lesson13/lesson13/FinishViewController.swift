//
//  ViewController.swift
//  lesson13
//
//  Created by Андрей Антонен on 24.11.2021.
//

import UIKit

class FinishViewController: UIViewController {
    
    let alertButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        title = "Finish"
        view.backgroundColor = .white
    
        alertButton.setTitle("Alert", for: .normal)
        alertButton.setTitleColor(.black, for: .normal)
        alertButton.addAction(
            UIAction(
                handler: { [weak self] _ in
                    let alert = self?.createAlert() ?? UIAlertController()
                    self?.present(
                        alert,
                        animated: true,
                        completion: nil)
            }), for: .touchUpInside
            )
        view.addSubview(alertButton)
    }
    
    private func setupConstraints() {
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    private func createAlert() -> UIViewController {
        let alert = UIAlertController(
            title: "Do you learn Swift?",
            message: "It's recommended you to learn Swift before continuing.",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        return alert
    }
}
