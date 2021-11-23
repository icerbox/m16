//
//  ViewController.swift
//  m12
//
//  Created by Андрей Антонен on 18.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.Image.star
        imageView.tintColor = traitCollection.userInterfaceStyle == .dark ? .white : .black
        return imageView
    }()
    
    private lazy var label1: UILabel = {
        let label = UILabel()
        // Устанавливаем стиль largeTitle
        label.font = Constants.Styles.largeTitle
        let string = Constants.Text.StarTeam
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: Constants.Text.StarTeam)
        if let commaIndex = string.firstIndex(of: " ") {
            attributedString.addAttribute(.foregroundColor,
                                          value: UIColor.systemRed,
                                          range: NSRange(string.startIndex ..< commaIndex, in: string)
            )
            attributedString.addAttribute(.foregroundColor,
                                          value: UIColor.systemBlue,
                                          range: NSRange(commaIndex ..< string.endIndex, in: string))
        }
        label.attributedText = attributedString
        return label
    }()
    private lazy var label2: UILabel = {
        let label = UILabel()
        // Устанавливаем стиль italicStyle
        label.font = Constants.Styles.italicStyle
        label.text = Constants.Text.text1
        label.textColor = Constants.Colors.primaryColor
        
        return label
    }()
    private lazy var label3: UILabel = {
        let label = UILabel()
        // Устанавливаем стиль title2
        label.font = Constants.Styles.customFontStyle
        label.text = Constants.Text.text2
        label.textColor = Constants.Colors.secondaryColor
        // Устанавливаем количество строк равным 2, чтобы переносились непоместившиеся слова
        label.numberOfLines = 2
        // выравниваем текст по центру
        label.textAlignment = .center
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateImageColor()
    }
    
    // MARK: - Private
    private func setupViews() {
        view.addSubview(stackView)
    }
    private func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    private func updateImageColor() {
        if traitCollection.userInterfaceStyle == .dark {
            imageView.tintColor = .white
        } else {
            imageView.tintColor = .black
        }
    }

}












