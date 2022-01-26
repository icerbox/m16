import UIKit

// Объявляем структуру которая будет использоваться в качестве вьюмодели данных

struct ViewModel {
    let cellImage: UIImage
    let cellHeader: String
    let cellText: String
}

// Объявляем массив данных с типом ViewModel

let data: [ViewModel] = [
    ViewModel(cellImage: Constants.Image.contentBlock ?? UIImage(),
              cellHeader: "Header",
              cellText: "He'll want to use your yacht, and I don't want this thing smelling like fish"),
    ViewModel(cellImage: Constants.Image.contentBlock ?? UIImage(),
              cellHeader: "Header",
              cellText: "He'll want to use your yacht, and I don't want this thing smelling like fish")
]
