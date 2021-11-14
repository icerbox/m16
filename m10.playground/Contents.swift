import UIKit

// Задание 1. Объявите три сущности, которые реализуют предоставленный вам протокол. После этого для всех сущностей вызовите все методы и свойства, объявленные в протоколе

// Протокол CalorieCountProtocol устанавливает следующие требования к реализуемым от него сущностям:
// 1. Должна быть объявлена целочисленная переменная calories доступная только на чтение
// 2. Должен быть объявлен метод description() который возвращает строку

protocol CalorieCountProtocol {
    var calories: Int { get }
    func description() -> String
}

// Реализуем первую сущность - класс Milk который реализует протокол CalorieCountProtocol.
class Milk: CalorieCountProtocol {
    // объявляем целочисленную переменную calories
    var calories: Int
    // инициализируем переменную
    init(calories: Int) {
        self.calories = calories
    }
    // объявляем метод description()
    func description() -> String {
        // в результате выполнения метод возвращает строку со значением переменной calories
        return ("В 100 грамма молока - \(calories) калорий")
    }
}
// Реализуем вторую сущность - структуру Beef который реализует протокол CalorieCountProtocol.
struct Beef: CalorieCountProtocol {
    // объявляем целочисленную переменную calories
    var calories: Int
    // инициализируем переменную
    init(calories: Int) {
        self.calories = calories
    }
    // объявляем метод description()
    func description() -> String {
        // в результате выполнения метод возвращает строку со значением переменной calories
        return ("В 100 грамма мяса - \(calories) калорий")
    }
}
// Реализуем третью сущность - перечисление Calories который реализует протокол CalorieCountProtocol.
enum Calories: Int, CalorieCountProtocol {
    // Объявляем свойство milk с rawValue равным 50
    case milk = 50
    // Объявляем свойство beef с rawValue равным 143
    case beef = 143
    // Объявляем вычисляемое свойство calories, которое возвращает значение rawValue, связанное с текущим членом перечисления
    var calories: Int { return self.rawValue }
    // Создаем метод description() который возвращает строку со значением rawValue текущего члена перечисления
    func description() -> String {
        return ("В 100 граммах - \(calories) калорий")
    }
}
// Создадим экземпляр класса Milk
let someMilk = Milk(calories: 52)
// Выполняем метод description
someMilk.description()

// Создадим экземпляр структуры Beef
let someBeef = Beef(calories: 145)
// Выполняем метод description
someBeef.description()

// Создадим экземпляр перечисления Calories
var some = Calories.milk
// Выполняем метод description
some.description()

// Задание 2. Поработайте с протоколом Equatable, который нужен для сравнения сущностей. Вам предоставлены структура и класс, которые нужно сравнить. Добавьте в объявление этих сущностей протокол Equatable. При необходимости реализуйте недостающий метод.

enum BalanceType {
    case positive, negative, neutral
}
// Добавляем в объявление структуры протокол Equatable
struct Balance: Equatable {
    let type: BalanceType
    let amount: Int
}
// Добавляем в объявление класса протокол Equatable
class BalanceObject: Equatable {
    // объявляем метод который сравнивает два объекта между собой
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        return (BalanceObject.self == BalanceObject.self)
    }
    var amount: Int = 0
}
// Создаем экземпляр структуры Balance с типом positive
let struct1 = Balance(type: BalanceType.positive, amount: 2)
// Создаем экземпляр класса BalanceObject
let class1 = BalanceObject()
// Задаем значение amount экземпляру класса
class1.amount = 2
// Сравним экземпляры структуры и класса с помощью оператора ==
struct1.amount == class1.amount

// Задание 3. Вам дан протокол и три сущности, которые его реализуют. Добавьте в протокол новый метод. Реализуйте этот метод с помощью расширения протокола. Создайте массив из этих сущностей и вызовите в цикле новый метод у каждого элемента массива.

protocol Dog {
    var name: String { get set }
    var color: String { get set }
    func speak() -> String
}

extension Dog {
    func speak() -> String {
        return ("Woof!")
    }
}

struct Haski: Dog {
    var name: String
    var color: String
    func speak() -> String {
        return "Woof! Haski"
    }
}

class Corgi: Dog {
    var name: String
    var color: String

    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    func speak() -> String {
        return "Woof! Corgi"
    }
}

struct Hound: Dog {
    var name: String
    var color: String
    func speak() -> String {
        return "Woof! Hound"
    }
}

// Создадим класс Вольер(Aviary), в который в виде массива aviary будут содержатся экземпляры типа Dog.
class Aviary {
    // Объявляем переменную aviary с пустым массивом данных типа Dog
    private var aviary: [Dog] = []
    // Объявляем метод для добавления экземпляров в массив aviary
    func add(dogName: Dog) {
        aviary.append(dogName)
    }
    // Создаем метод который для каждого элемента массива будет вызывать его собственный метод speak. Т.е. для каждого элемента будет вызван новый метод
    func speakTogether() {
        for dog in aviary {
            print(dog.speak())
        }
    }
}
// Создаем экземпляры сущностей
let haski = Haski(name: "Jack", color: "White")
let corgi = Corgi(name: "Bobbi", color: "Black")
let hound = Hound(name: "Piter", color: "Grey")
// объявляем экземпляр класса Aviary
let aviary = Aviary()
// При помощи метода add() добавляем созданные экземпляры
aviary.add(dogName: haski)
aviary.add(dogName: corgi)
aviary.add(dogName: hound)
// Запускаем метод speakTogether() который перебирает массив собак и запускает их методы speak()
aviary.speakTogether()

















