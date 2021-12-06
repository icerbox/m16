//
//  ViewController.swift
//  lesson13
//
//  Created by Андрей Антонен on 24.11.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        title = "Start"
        view.backgroundColor = .white
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Custom", style: .plain, target: nil, action: nil)
        
        nextButton.setTitle("Next Scene", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.addAction(
            UIAction(
                handler: { [weak self] _ in
            self?.navigationController?.pushViewController(FinishViewController(), animated: true)
            }), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    private func setupConstraints() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    deinit {
        print("deinit")
    }
}

extension StartViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear")
    }
    
    override func loadView() {
        super.loadView()
        
        print("loadView")
    }
}







