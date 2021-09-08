import UIKit

let condition1: Bool = 5 > 0
let condition2 = 5 >= 5
let condition3 = 4 == 4
let condition4 = 1 != 4
let conditionOr = condition1 || condition2
let conditionAnd = condition1 && condition2
//let temperature = 0

// Конструкция if-else

//if temperature > 25 {
//    print("Hot")
//} else if temperature == 0 {
//    print("Zero")
//}
//else {
//    print("Cold")
//}

// Раскрытие Optionals

let userInput: String? = "Skillbox"

func playground(value: String?) {
    if let optional = value {
        print(optional)
    } else {
        print("пустая строка")
    }
    
    guard let value = value else {
        print("пустая строка")
        return
    }
    print(value)
}

playground(value: userInput)

// Циклы

let names: [String] = ["John", "Alice", "Bob"]
func sendEmail(to name: String) {
    print("email was sent to \(name)")
}

for name in names {
    sendEmail(to: name)
}

var sum = 0
for number in 0...1000 {
    if (number % 10) == 0 {
        sum += number
    } else {
        break
    }
    print(number)
}
print(sum)


func increaseTemperature(_ temperature: Int, by degree: Int) -> Int {
    return temperature + degree
}

var temperature = 0

while(temperature < 0) {
    // Повторить следующий код
    temperature = increaseTemperature(temperature, by: 1)
}
print("while loop, result - \(temperature)")

temperature = 0
repeat {
    // Повторить следующий код
    temperature = increaseTemperature(temperature, by: 1)
} while(temperature < 0)

print("repeate while loop, result - \(temperature)")

// инструкция switch

let someNumber: Int = 4
switch someNumber {
case 1:
    print("Один")
case 2,4:
    print("Два или четыре")
default:
    print("Другое число")
}

let score: Int = 9

switch score {
case 1:
    print("Оценка - \(score), произносится как \"Кол\"")
case 2:
    print("Оценка - \(score), произносится как \"Двойка\"")
case 3:
    print("Оценка - \(score), произносится как \"Тройка\"")
case 4:
    print("Оценка - \(score), произносится как \"Четверка\"")
case 5:
    print("Оценка - \(score), произносится как \"Отлично\"")
default:
    print("Оценка \(score) не используется.")
}

let date = Date()

let dateFormatter = DateFormatter()

dateFormatter.dateFormat = "yyyy- MM-dd HH:mm:ss"

let arrayOfDates: [Date] = [
    Calendar.current.date(byAdding: .day, value: 10, to: date)!,
    Calendar.current.date(byAdding: .day, value: 20, to: date)!,
    Calendar.current.date(byAdding: .day, value: 30, to: date)!,
    Calendar.current.date(byAdding: .day, value: 40, to: date)!
]

var arrayOfStringDates: [String] = []

for i in arrayOfDates {
    let stringDate = dateFormatter.string(from: i)
    arrayOfStringDates.append(stringDate)
}
print(arrayOfStringDates)
