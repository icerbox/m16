import UIKit

class SecondCustomTableViewCell: UITableViewCell {

    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var publishedAt: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.greenSecondary
        label.font = Constants.Fonts.systemText
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(publishedAt)
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
    
    func configure(_ viewModel: NewsRecordModel, datesModel: StringRecordModel) {
        title.text = viewModel.title
        publishedAt.text = datesModel.publishedAt
    }
    
    private func setupConstraints() {
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.distribution = .fillProportionally
        stackView.widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
}
