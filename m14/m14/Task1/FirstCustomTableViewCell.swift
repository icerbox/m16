import UIKit

class FirstCustomTableViewCell: UITableViewCell {

    private lazy var countryImages: UIImageView = {
        let countryImages = UIImageView()
        countryImages.contentMode = .scaleAspectFit
        
        return countryImages
    }()
    
    private lazy var countryNames: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        return label
    }()
        
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.addArrangedSubview(countryImages)
        stackView.addArrangedSubview(countryNames)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        countryImages.image = nil
    }
    
    func configure(_ viewModel: FirstCustomTableViewCellViewModel) {
        countryImages.image = viewModel.countryImages
        countryNames.text = viewModel.countryNames
    }
    
    private func setupConstraints() {
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
