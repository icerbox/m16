import UIKit

enum Constants {
    enum Colors {
        static var primaryColor: UIColor? {
            UIColor(named: "primaryColor")
        }
        static var secondaryColor: UIColor? {
            UIColor(named: "secondaryColor")
        }
    }
    enum Text {
        static let StarTeam = Bundle.main.localizedString(forKey: "STAR TEAM", value: "", table: "Localizable")
        static let text1 = Bundle.main.localizedString(forKey: "is a revision control system", value: "", table: "Localizable")
        static let text2 = Bundle.main.localizedString(forKey: "created by Starbase Corporation", value: "", table: "Localizable")
    }
    enum Styles {
        static var largeTitle: UIFont? {
            UIFont.boldSystemFont(ofSize: 20)
        }
        static var italicStyle: UIFont? {
            UIFont.italicSystemFont(ofSize: 18)
        }
        static var customFontStyle: UIFont? {
            UIFont(name: "Avenir-black", size: 18)
        }
    }
    enum Image {
        static let play = UIImage(named: "play")
        static let star = UIImage(named: "star")
    }
}
