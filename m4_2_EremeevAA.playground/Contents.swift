import UIKit

//Дополнительные задания:
//1. Поисследовать фреймворк CoreGraphics https://developer.apple.com/documentation/coregraphics на предмет структур, которые описывают положение на плоскости, размер и прямоугольник.

// Ответ: В фреймворке CoreGraphics структурой которая описывает положение объектов на плоскости является struct CGPoint. Размеры объектов содержатся в структуре struct CGSize. Расположение и размеры прямоугольника содержатся в структуре CGRect

// 2. Реализовать перечисление, которое представляет собой тип авторизации пользователя по номеру телефону, по почте, по логину.

// С каждым случаем должно быть связано значение по смыслу, то есть, например, для авторизации по номеру телефона должен быть номер телефона.
// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID148

enum Authorization: String {
    case phone = "7999111222"
    case email = "icerbox@gmail.com"
    case login = "icer"
}

var authorizationToApp = Authorization.login
authorizationToApp = .email
switch authorizationToApp {
case .phone:
    print("Введите номер вашего телефона")
case .email:
    print("Введите ваш электронный адрес")
case .login:
    print("Введите ваш логин выданный при регистрации")
}
// Должно вывести "Введите ваш электронный адрес"

//3. Реализовать калькулятор, используя recursive enumeration
// https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html#ID536

indirect enum Calculator {
    case number(Int)
    case addition(Calculator, Calculator)
    case multiplication(Calculator, Calculator)
    case division(Calculator, Calculator)
}

var number1  = Calculator.number(10)
var number2  = Calculator.number(2)
let sum = Calculator.addition(number1, number2)
let product = Calculator.multiplication(number1, number2)
let division = Calculator.division(number1, number2)

func calculate(_ expression: Calculator) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return calculate(left) + calculate(right)
    case let .multiplication(left, right):
        return calculate(left) * calculate(right)
    case let .division(left, right):
        if calculate(left) > calculate(right) {
            return calculate(left) / calculate(right)
        }
        else {
            return 0
        }
    }
}
print(calculate(product))

// Должно вывести цифру 2

//4. Используя CaseIterable создать полную колоду карт https://developer.apple.com/documentation/swift/caseiterable

// создаем перечисление содержащее имена карт
enum Rank: CaseIterable {
    case Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
}
// создаем перечисление для мастей карт
enum Suit: CaseIterable {
    case Spades, Hearts, Diamonds, Clubs
}

// создаем структуру которая будет описывать текущую карту, забирая данные из перечислений для имен и мастей карт
struct CurrentCard {
    // Масть игральной карты
    var cardSuit: Suit
    // Имя игральной карты
    var cardRank: Rank
    // инициализируем свойства структуры
    init(suit: Suit, rank: Rank) {
        self.cardSuit = suit
        self.cardRank = rank
    }
}
// создаем класс где будет храниться массив создаваемой колоды карт и методы необходимые для его создания
class CardDeck {
    var deck: [CurrentCard]  // Массив deck имеет тип структуры описывающей карту
    init() {
        deck = []
    }
    // объявляем метод для создания колоды карт
    func createDeck() {
        // т.к. наши перечисления соответствуют протоколу CaseIterable, то для доступа к коллекции карт можно использовать свойство allCases
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(CurrentCard(suit: suit, rank: rank))
                // используя свойство массива append формируем массив колоды карт
            }
        }
    }
    // объявляем метод для вывода колоды карт
    func listDeck() {
        for card in deck {
            print(card)
        }
    }
}

var deck = CardDeck()

deck.createDeck()
deck.listDeck()

//5. Прочитать статью https://developer.apple.com/documentation/swift/choosing_between_structures_and_classes

//Ответ: Прочитано

//6. Изучить Swift API design guidelines https://swift.org/documentation/api-design-guidelines/

//Ответ: Прочитано


//7. Можно ли внутри класса написать определение класса/структуры/перечисления? А внутри структуры? Внутри перечисления?

//Ответ: Если имеется в виду ситуация, когда внутри класса сначала объявляется другой класс и внутри объявленного класса определение этого класса/структуры/перечисления то да, можно. Внутри структуры и перечислений также можно определять. Без объявления внутреннего класса/структуры/перечисления нельзя определять.

//Пример определения класса/структуры/перечисления внутри класса SomeClass :
class SomeClass {
    // Объявляем внутри нашего класса новый класс NextClass
    class NextClass {
        var value = true // Внутри фигурных скобок пишем определение нового класса
    }
    // Объявляем внутри класса новую структуру SomeStruct
    struct SomeStruct {
        var value = 0 // Внутри фигурных скобок пишем определение новой структуры
    }
    // Объявляем внутри класса новое перечисление
    enum SomeEnum {
        case one // Внутри фигурных скобок пишем определение нового перечисления
    }
}

// Пример определения класса/структуры/перечисления внутри структуры SomeStruct2

struct SomeStruct2 {
    // Объявляем внутри структуры новый класс SomeClass2
    class SomeClass2 {
        var value = true // Внутри фигурных скобок пишем определение нового класса
    }
     // Объявляем внутри структуры новую структуру InnerStruct
    struct InnerStruct {
        var innerValue = 1 // Внутри фигурных скобок пишем определение новой структуры
    }
    // Объявляем внутри структуры новое перечисление
    enum SomeEnum2 {
        case one // Внутри фигурных скобок пишем определение нового перечисления
    }
}

// Пример определения класса/структуры/перечисления внутри перечисления SomeEnum3

enum SomeEnum3 {
    class SomeClass3 {
        var value = true // Внутри фигурных скобок пишем определение нового класса
    }
    struct InnerStruct2 {
        var innerValue = 1 // Внутри фигурных скобок пишем определение новой структуры
    }
    enum SomeEnum4 {
        case one // Внутри фигурных скобок пишем определение нового перечисления
    }
}

// Внутри протокола? Написать протокол внутри протокола? Или протокол внутри класса/структуры/перечисления?

//Ответ: Нельзя


// 8. Может ли своя структура, класс, перечисление быть rawValue для перечисления? Если да, то попробуйте привести пример.

// Ответ: Структура, класс, перечисление могут быть rawValue для перечисления. Для этого необходимо чтобы он соответствовал протоколу Equatable.

//Рассмотрим на примере структуры в качестве rawValue для перечисления. Для класса и перечиcления все аналогично, поэтому мы их рассматривать не будем.

struct PlanetStruct: Equatable { // Объявляем структуру и указываем соответствие протоколу Equatable
    var string: String
}

enum Planet: PlanetStruct { // В созданном перечислении вместо типа данных указываем нашу структуру
    case mercury
    case venus
    case earth
}

// Для того, чтобы это работало, приводим наш тип PlanetStruct в соответствие с ExpressibleByStringLiteral

extension PlanetStruct: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        string = stringLiteral
    }
}
