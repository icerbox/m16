import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    // Объявляем имэджвью для картинки в левой ячейке
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Объявляем лэйбл для хидера
    
    private lazy var cellHeader: UILabel = {
       let label = UILabel()
        label.textColor = Constants.Colors.blackFont
        label.font = Constants.Fonts.ui16Semi
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    // Объявляем лэйбл для основного текста
    
    private lazy var cellText: UILabel = {
       let label = UILabel()
        label.textColor = Constants.Colors.blackFont
        label.font = Constants.Fonts.ui14Regular
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    // Добавляем стэквью для ячейки с картинкой
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        stackView.addArrangedSubview(cellImage)
        return stackView
    }()
    
    // Добавляем стэквью для ячейки с двумя лейблами
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .firstBaseline
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.addArrangedSubview(cellHeader)
        stackView.addArrangedSubview(cellText)
        return stackView
    }()
    
    // Инициализируем кастомные ячейки
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        contentView.addSubview(stackView2)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        cellImage.image = nil
    }
    // MARK: - ViewModel configuration
    
    // Настраиваем вьюмодель. Указываем соответствие нашего имэджвью и лейблов данным из структуры, которая объявлена в ViewModel.swift
    
    func configure(_ viewModel: ViewModel) {
        cellImage.image = viewModel.cellImage
        cellHeader.text = viewModel.cellHeader
        cellText.text = viewModel.cellText
    }
    
    // MARK: - Constraints
    
    // При помощи SnapKit устанавливаем констрейнты для двух стэквью.
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.right.equalTo(stackView2.snp.left)
            make.bottom.equalTo(contentView)
            make.left.equalTo(contentView)
        }
        stackView2.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
            make.left.equalTo(stackView.snp.right)
        }
    }
}
