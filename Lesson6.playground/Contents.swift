import UIKit


// 6.2 Словари:

// Явно указываем тип
let explicityType: [Int: String] = [:]
// Не явно указываем тип
let implicityType = [Int: String]()
// Тип словаря определяется по типу значений
let implicityWithValues = [1: "One"]
// Инициализация пустого словаря
let emptyDictionary: [String: String] = [:]

// Ключ должен быть хешируемым
// Значение Any - может представлять экземпляр любого
// let dictionary = Dictionary<String, Any>

// 6.3 Доступ к элементам словаря

var numbersDictionary = [0: "Zero", 1: "One", 10: "Ten"]

print("The number dictionary contains \(numbersDictionary.count) items")

print("isProperty equals \(numbersDictionary.isEmpty)")

numbersDictionary[11] = "Eleven"

if let eleven = numbersDictionary[11] {
    print("The name of number is \(eleven).")
} else {
    print("The name of number isn't exist.")
}

// это выражение возвращает удаленный элемент
let removedValue = numbersDictionary.removeValue(forKey: 0)

for (key, value) in numbersDictionary {
    print("\(key): \(value)")
}

for key in numbersDictionary.keys {
    print("\(key)")
}


// 6.4. Обработка ошибок

enum ValidationError: Error, LocalizedError {
    case tooShort
    case tooLong
    case invalidCharacterFound(Character)
    
    var errorDescription: String? {
        var description = ""
        
        switch self {
        case .tooShort:
            description = "Too Short"
        case .tooLong:
            description = "Too Long"
        case let .invalidCharacterFound(char):
            description = "Invalid Char - \(char)"
        }
        return description
    }
}

//func canThrowErrors() throws -> String { return String() }
//
//func cannotThrowErrors() -> String { return String() }

func validate(username: String) throws {
    guard username.count > 3 else {
        throw ValidationError.tooShort
    }
    
    guard username.count < 15 else {
        throw ValidationError.tooLong
    }
    
    for character in username {
        guard character.isLetter else {
            throw ValidationError.invalidCharacterFound(character)
        }
    }
}

func onUserInputName(username: String) {
//    do {
//        try validate(username: username)
//        // если валидация не вернула нам ошибку, значит
//        // пользователь ввел валидное имя пользователя
//        print(username)
//    } catch {
//        // если мы попали сюда, значит произошла ошибка
//        // ее надо обработать здесь
//        print(error.localizedDescription)
//    }
    print((try? validate(username: username)) == nil)
}

onUserInputName(username: "John1")

// 6.5. Перечисления

enum CompassPoint {
    case north
    case south(String, Int)
    case east
    case west
    
    func getDescription() -> String {
        switch self {
        case .north:
            return ("North")
        case let .south(name, index):
            return ("\(name) - \(index)")
        case .east:
            return ("East")
        case .west:
            return ("West")
        }
    }
}

let compassPoint = CompassPoint.east

compassPoint.getDescription()
