import UIKit

class PopViewController: UIViewController {
    
    let eventDescription: String
    let eventLocation: String
    
    
    init(eventDescription: String, eventLocation: String) {
        self.eventDescription = eventDescription
        self.eventLocation = eventLocation
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var eventLocationLabelTitle: UILabel  = {
        let label = UILabel()
        label.text = "Location"
        label.font = Constants.Fonts.systemHeading
        label.textColor = .label
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var eventLocationLabel: UILabel  = {
        let label = UILabel()
        label.text = eventLocation
        label.textColor = .label
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var eventDescriptionLabelTitle: UILabel  = {
        let label = UILabel()
        label.text = "Description"
        label.font = Constants.Fonts.systemHeading
        label.textColor = .label
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var eventDescriptionLabel: UILabel  = {
        let label = UILabel()
        label.text = eventDescription
        label.textColor = .label
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .white
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(eventLocationLabelTitle)
        stackView.addArrangedSubview(eventLocationLabel)
        stackView.addArrangedSubview(eventDescriptionLabelTitle)
        stackView.addArrangedSubview(eventDescriptionLabel)
    }
    
    private func setupConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
