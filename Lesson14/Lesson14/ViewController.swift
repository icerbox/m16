//
//  ViewController.swift
//  Lesson14
//
//  Created by Андрей Антонен on 07.12.2021.
//

import UIKit

class ViewController: UIViewController {
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 40, width: 100, height: 50), primaryAction: UIAction(handler: {
            [weak self] _ in self?.tableView.isEditing = !(self?.tableView.isEditing ?? false)
        }))
        button.backgroundColor = .systemBlue
        button.setTitle("Editing", for: .normal)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
        return tableView
    }()
    
    let cellWithTwoLabelsAndImage = "cellWithTwoLabelsAndImage"
    
    let animals: [CellWithTwoLabelsViewModel] = [
        CellWithTwoLabelsViewModel(labelOneText: "Horse", labelTwoText: "Black"),
        CellWithTwoLabelsViewModel(labelOneText: "Cow", labelTwoText: "Blue"),
        CellWithTwoLabelsViewModel(labelOneText: "Camel", labelTwoText: "Green"),
        CellWithTwoLabelsViewModel(labelOneText: "Sheep", labelTwoText: "Red"),
        CellWithTwoLabelsViewModel(labelOneText: "Goat", labelTwoText: "White")
    ]
    
    var dataWithImages: [CellWithTwoLabelsAndImageViewModel] = [
        CellWithTwoLabelsAndImageViewModel(
            title: "title 1",
            text: "text 1",
            image: Constants.Image.house ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
            title: "title 2",
            text: "text 2",
            image: Constants.Image.lasso ?? UIImage()
        ),
        CellWithTwoLabelsAndImageViewModel(
            title: "title 3",
            text: "text 3",
            image: Constants.Image.pencil ?? UIImage()
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.register(CellWithTwoLabelsAndImage.self, forCellReuseIdentifier: "cellWithTwoLabelsAndImage")
        
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(button)
    }
    private func setupConstraints() {
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
            0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:
            100).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:
            0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:
            0).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataWithImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithTwoLabelsAndImage) as? CellWithTwoLabelsAndImage
        let viewModel = dataWithImages[indexPath.row]
        cell?.configure(viewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.dataWithImages.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.dataWithImages[sourceIndexPath.row]
        dataWithImages.remove(at: sourceIndexPath.row)
        dataWithImages.insert(movedObject, at: destinationIndexPath.row)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = dataWithImages[indexPath.row]
        let alertController = UIAlertController(
            title: "\(viewModel.title)",
            message: "\(viewModel.text)",
            preferredStyle: .alert
        )
        let dismissAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { action in
                tableView.deselectRow(at: indexPath, animated: true)
        })
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
}




