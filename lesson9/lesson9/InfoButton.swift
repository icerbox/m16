//
//  InfoButton.swift
//  lesson9
//
//  Created by Андрей Антонен on 01.11.2021.
//

import UIKit

protocol InfoButtonDelegate: AnyObject {
    func onButtonPress()
}
class InfoButton: UIButton {
    weak var delegate: InfoButtonDelegate?
    
    private let color = UIColor.lightGray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        addTarget(self, action: #selector(click), for: .touchUpInside)
        backgroundColor = color
    }
    
    @objc private func click() {
        delegate?.onButtonPress()
    }
}
