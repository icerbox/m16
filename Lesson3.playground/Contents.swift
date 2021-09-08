import UIKit
import Foundation

// Объявление функций
func sayHello(name: String, age: String) -> String {
    let helloStr = "Hello " + name + " " + age
    return helloStr
}

sayHello(name: "Aysen", age: "39")

func printHello() {
    let hello = "Hello, World!"
    print(hello)
}

printHello()

// Объявление кортежей
let values: (numberValue: Int, stringValue: String) = (numberValue: 1, stringValue: "Aysen")

print(values.stringValue)

//

func getHelloAndNumber() -> (numberValue: Int, stringValue: String) {
    let values: (numberValue: Int, stringValue: String) = (numberValue: 1, stringValue: "Aysen")
    return values
}

print(getHelloAndNumber())

func getSum(_ number1: Int, _ number2: Int) -> Int {
    return number1 + number2
}

getSum(10, 5)

// Работа со строками

// Цитирование большого текста

let stringValue: String = "string"

let quotation = """
The White Rabbit put on his spectacles. "Where shall i begin, please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on till you come to the end; then stop."
"""

print(quotation)

// Спецсимвол переноса строки

let newLines = "строка 1 \nстрока 2\nстрока 3"

print(newLines)

// Инициализация пустых строк

var emptyString = "" // empty string literal
var anotherEmptyString = String() // initializer syntax
// обе строка пусты и эквивалентны друг другу
// Можно узнать пустое ли String значение, через его Boolean свойство isEmpty
print(emptyString.isEmpty)

// Конкатенация строк
var concatenatedString = "Skill" + "box"
concatenatedString += "!!"

// Интерполяция строк
let filler = "наполнитель"
let interpolatedString = "строка содержит: \(filler)"

let multiplier = 4
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"

// Тип данных Data
let currentDateTime = Date()

let dateWithSeconds = Date(timeIntervalSinceReferenceDate: -123456789.0)

var dateComponents = DateComponents()
dateComponents.year = 1999
dateComponents.month = 8
dateComponents.day = 10
dateComponents.timeZone = TimeZone(abbreviation: "JST")
dateComponents.hour = 6
dateComponents.minute = 44

let currentCalendar = Calendar.current
let dateFromComponents = currentCalendar.date(from: dateComponents)

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:sssZ"
let someDateTime = formatter.date(from: "2020-08-04T10:00:00.000Z")

let date: Date = Date()
formatter.string(from: date)

// работа с символами

var welcome: String = "Welcome"

let exclamationMark: Character = "!"

welcome.append(exclamationMark)

let dogString = "Dog!!\u{1F436}"


// подсчет символов

let animals = "Коала , Улитка , Пингвин , Верблюд "
print("animals содержит \(animals.count) символов")

// доступ по индексу

var greeting = "HI"
greeting[greeting.startIndex]

//вставка по индексу
greeting.insert("!", at: greeting.endIndex)
