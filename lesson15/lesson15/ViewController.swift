//
//  ViewController.swift
//  lesson15
//
//  Created by Андрей Антонен on 24.01.2022.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    
    private lazy var downloadedImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var imageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Downloaded Image"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setupConstraints()
        downloadImage()
    }
    
    private func setupViews() {
        view.addSubview(downloadedImage)
        view.addSubview(imageLabel)
    }
    
    private func setupConstraints() {
        downloadedImage.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageLabel.snp.top).inset(20)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(downloadedImage.snp.centerX)
        }
    }
    private func downloadImage() {
        let remoteImageURL = URL(string: "https://coffee.alexflipnote.dev/G31vEzJYoWo_coffee.png")!
        
        AF.download(remoteImageURL).responseData { response in
            if response.error == nil {
                self.downloadedImage.image = UIImage(data: response.value ?? Data())
            }
        }
    }
}

