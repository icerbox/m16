import UIKit

// Структуры
//struct Resolution {
//    var width = 0
//    var height = 0
//    mutating func setHeight(_ height: Int) {
//        self.height = height
//    }
//}
//
//let resolution = Resolution(width: 5, height: 10)
//
//var resolution2 = resolution
//
//
//resolution2.setHeight(2)
//print(resolution)
//print(resolution2)

// Классы

//class Resolution {
//    var width: Int
//    var height: Int
//    init(width: Int, height: Int) {
//        self.width = width
//        self.height = height
//    }
//}
//
//let resolution = Resolution(width: 11, height: 22)
//
//var resolution2 = resolution
//
//resolution.width = 5
//
//print(resolution.width)
//print(resolution2.width)
//
//class Mammal {
//    let legNumber = 4
//
//    func says() -> String {
//        return ""
//    }
//}
//
//class Cat: Mammal {
//    override func says() -> String {
//        return "Meow!"
//    }
//}
//
//let cat = Cat()
//
//cat.legNumber
//print(cat.says())


// Ленивые свойства
//class ShapeLazy {
//    var width: Int
//    var height: Int
//
//    lazy var square: Int = {
//        width * height
//    }()
//    init(width: Int, height: Int) {
//        self.width = width
//        self.height = height
//    }
//}
//
//let shape = ShapeLazy(width: 10, height: 20)
//
//print(shape.square)
//
//shape.height = 30
//
//print(shape.square)

// Статические свойства

class ShapeStatic {
    static var width: Int = 5
    static var height: Int = 10
    
    static func square() -> Int {
        width * height
    }
}

print(ShapeStatic.height)
print(ShapeStatic.square())


// Модификаторы доступа

struct Shape {
    func square() -> String {
        return "Square"
    }
    private func helperFunction () -> String {
        return "Helper Function"
    }
}

let shape = Shape()

shape.square()

// Разница между структурами и классами

class Person {
    var department: Department?
    
    init() {
        print("person initialized")
    }
    
    deinit {
        print("person deallocated")
    }
}

class Department {
    weak var person: Person?
    init() {
        print("department initialized")
    }
    
    deinit {
        print ("department deallocated")
    }
}

// Создаем в памяти Person
var person: Person? = Person()
// Присваиваем Department к Person
var department: Department? = Department()
person?.department = department
department?.person = person
// Сбрасываем счетчик ссылок в ноль с помощью nil
person = nil
department = nil







