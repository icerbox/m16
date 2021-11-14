import UIKit
// Объявляем протокол описывающий сущность "Животное"
protocol AnimalProtocol {
    var energy: Int { get set }
    var weight: Int { get set }
    var age: Int { get set }
    var maxAge: Int { get }
    var name: String { get }
    var isTooOld: Bool { get }
    var isMoveCalled: Bool { get set }
    func sleep()
    func tryIncrementAge()
    func eat()
    func move()
    func birth()
    init(energy: Int, weight: Int, age: Int, maxAge: Int, name: String)
}
// Объявляем протокол описывающий обслуживание заповедника

protocol ReserveMaintanance {
    var natureReserve: [Animal] { get set }
    func add(element: Animal)
    func delete(element: Animal)
    func show()
    func liveCycle()
}
// Объявляем родительский класс Animal который будет суперклассом для других подвидов животных
class Animal: AnimalProtocol {
    // Объявляем свойства класса:
    var energy: Int
    var weight: Int
    var age: Int
    let maxAge: Int
    let name: String
    // Объявляем свойство isMoveCalled для отслеживания выполнения родительской реализации метода move(), которая будет использоваться для задания 8. До выполнения родительской реализации метода значение равно false.
    var isMoveCalled: Bool = false
    // Добавляем вычисляемое свойство isTooOld, который будет возвращать true если возраст равен или больше максимального
    var isTooOld: Bool {
        get {
            return age >= maxAge
        }
        set(isTooOld) {
            isTooOld == true
        }
    }
    // Создаем инициализатор для класса
    required init(energy: Int, weight: Int, age: Int, maxAge: Int, name: String) {
        self.energy = energy
        self.weight = weight
        self.age = age
        self.maxAge = maxAge
        self.name = name
    }
    
    // метод для сна
    func sleep() {
        // Если слишком стар, то дальше ничего не выполняем
        if self.isTooOld {
            return
        // В противном случае идем дальше
        } else {
        self.energy = energy + 5
        self.age = age + 1
            print("\(self.name) спит")
        }
    }
    // Объявляем метод tryIncrementAge для случайного увеличения возраста
    func tryIncrementAge() {
        if(Bool.random()) {
            self.age = self.age + 1
            print("Произошло случайное увеличение возраста +1")
        }
    }
    // метод для питания
    func eat() {
        // Если слишком стар, то дальше ничего не выполняем
        if self.isTooOld {
            print("Животное слишком старое, ничего не выполняем")
            return
        // В противном случае идем дальше
        } else {
        // Энергия увеличивается на 3
        self.energy = energy + 3
        // вес увеличивается на 1
        self.weight = weight + 1
        // выводим сообщение
        print("\(self.name) ест")
        // Пробуем увеличить возраст
        tryIncrementAge()
        }
    }
    // метод для передвижения
    func move() {
        // Если энергия или вес равны или меньше 0, то дальше ничего не выполняем
        if self.energy <= 0 || self.weight <= 0 {
            print("Не хватает энергии или веса")
            return
        // В противном случае идем дальше
        } else {
        // Энергия уменьшается на 5
        self.energy = energy - 5
        // Вес уменьшается на 1
        self.weight = weight - 1
        // Выводим сообщение
        print("Родительская реализация: \(name) передвигается")
        // Пробуем увеличить возраст
        tryIncrementAge()
        // В конце ставим метку отражающую выполнение родительской реализации метода.
        isMoveCalled = true
        }
    }
    // метод для рождения детенышей
    func birth() {
        // Имя и максимальный возраст делаем такими же как и у родителя. Энергия устанавливается случайно в диапазоне от 1 до 10. Вес устанавливается случайно в диапазоне от 1 до 5.
        let child = Animal(energy: Int.random(in: 0...10), weight: Int.random(in: 1...5), age: 0, maxAge: self.maxAge, name: self.name)
        // Выводим в консоль характеристики новорожденного детеныша
        print("Родился: \(child.name), Энергия: \(child.energy), Вес: \(child.weight), Возраст: \(child.age), Максимальный возраст: \(child.maxAge)")
    }
}

// Создаем наследника Bird класса Animal
class Bird: Animal {
    // Переопределяем функцию, отвечающую за передвижение
    override func move() {
    // Вызываем родительскую реализацию функции
    super.move()
        // Если родительская реализация функции выполнилась, то выводим в консоль "\(name) летит"
        if isMoveCalled {
            print("\(self.name) летит")
        }
    }
    // Переопределяем функцию, отвечающую за рождение потомка.
    override func birth() {
        let child = Bird(energy: Int.random(in: 0...10), weight: Int.random(in: 0...5), age: 0, maxAge: self.maxAge, name: self.name)
        print("Родился: \(child.name), Энергия: \(child.energy), Вес: \(child.weight), Возраст: \(child.age), Максимальный возраст: \(child.maxAge)")
    }
}

// Создаем наследника Fish класса Animal
class Fish: Animal {
    // Переопределяем функцию, отвечающую за передвижение
    override func move() {
    // Вызываем родительскую реализацию функции
    super.move()
        // Если родительская реализация функции выполнилась, то выводим в консоль "\(name) плывет"
        if isMoveCalled {
            print("\(self.name) плывет")
        }
    }
    // Переопределяем функцию, отвечающую за рождение потомка.
    override func birth() {
        let child = Fish(energy: Int.random(in: 0...10), weight: Int.random(in: 0...5), age: 0, maxAge: self.maxAge, name: self.name)
        print("Родился: \(child.name), Энергия: \(child.energy), Вес: \(child.weight), Возраст: \(child.age), Максимальный возраст: \(child.maxAge)")
    }
}

// Создаем наследника Dog класса Animal
class Dog: Animal {
    // Переопределяем функцию, отвечающую за передвижение
    override func move() {
    // Вызываем родительскую реализацию функции
    super.move()
        // Если родительская реализация функции выполнилась, то выводим в консоль "\(name) бежит"
        if isMoveCalled {
            print("\(self.name) бежит")
        }
    }
    // Переопределяем функцию, отвечающую за рождение потомка.
    override func birth() {
        let child = Dog(energy: Int.random(in: 0...10), weight: Int.random(in: 0...5), age: 0, maxAge: maxAge, name: name)
        print("Родился: \(child.name), Энергия: \(child.energy), Вес: \(child.weight), Возраст: \(child.age), Максимальный возраст: \(child.maxAge)")
    }
}

// Создаем класс NatureReserve который представляет собой заповедник с разными животными. Он инкапсулирует массив с типом Animal, а также методы для управления животными.
class NatureReserve: ReserveMaintanance {
    // Объявляем переменную natureReserve который является массивом элементов с типом Animal.
    var natureReserve: [Animal] = []
    // Объявлявем метод для добавления животных в массив заповедника
    func add(element: Animal) {
        self.natureReserve.append(element)
    }
    // Объявляем метод для удаления животных из массива заповедника
    func delete(element: Animal) {
        if let index = natureReserve.enumerated().filter( { $0.element === element }).map({ $0.offset }).first {
            natureReserve.remove(at: index)
        }
    }
    // Объявляем метод для показа количества и названий животных в заповеднике
    func show() {
        let animalNamesArray = natureReserve.map { $0.name }
        print("Сейчас в заповеднике \(animalNamesArray.count) животных. Это: \(animalNamesArray)")
    }
    // Объявляем метод имитирующий жизненный цикл животных
    func liveCycle() {
        // Для каждого животного в массиве
        for animal in natureReserve {
            print("Начинает ход \(animal.name), с возрастом: \(animal.age) лет")
            // выполняем по n-случайных итераций. Дадим название циклу чтобы можно было позже к нему обратиться
            outerLoop: for i in 1...3 {
                // Объявляем константу doAction, который будет в случайном порядке решать какое действие выполнит текущее животное
                let doAction = Int.random(in: 1...4)
                // В целях диагностики показываем номер действия
                print("Выполняем итерацию № \(i) действие \(doAction)")
                // В зависимости от выпавшей случайно цифры от 1 до 4 выполняем действия
                switch doAction {
                // Если выпало число 1 то животное кушает
                case 1:
                    animal.eat()
                    // Если животное после еды достигает предельного возраста то:
                    if animal.isTooOld {
                        // удаляем животное из заповедника
                        reserve.delete(element: animal)
                        // выводим сообщение
                        print("Животное \(animal.name) с максимальным возрастом \(animal.maxAge) лет, достиг возраста \(animal.age) лет - и был удален из заповедника")
                        // показываем текущий состав заповедника
                        reserve.show()
                        // Если заповедник пуст программа прерывается и выводится сообщение
                        if natureReserve.isEmpty {
                            print("Все животные исчезли. Заповедник закрывается")
                            return
                        }
                        // прекращаем выполнение цикла outerLoop
                        break outerLoop
                    }
                    // показываем текущий состав заповедника
                    reserve.show()
                case 2:
                    animal.sleep()
                    // Если животное после сна достигает предельного возраста то:
                    if animal.isTooOld {
                        // удаляем животное из заповедника
                        reserve.delete(element: animal)
                        // выводим сообщение
                        print("Животное \(animal.name) с максимальным возрастом \(animal.maxAge) лет, достиг возраста \(animal.age) лет - и был удален из заповедника")
                        // показываем текущий состав заповедника
                        reserve.show()
                        // Если заповедник пуст программа прерывается и выводится сообщение
                        if natureReserve.isEmpty {
                            print("Все животные исчезли. Заповедник закрывается")
                            return
                        }
                        // прекращаем выполнение цикла outerLoop
                        break outerLoop
                    }
                    // показываем текущий состав заповедника
                    reserve.show()
                case 3:
                    animal.move()
                    // Если животное после передвижения достигает предельного возраста то:
                    if animal.isTooOld {
                        // удаляем животное из заповедника
                        reserve.delete(element: animal)
                        // выводим сообщение
                        print("Животное \(animal.name) с максимальным возрастом \(animal.maxAge) лет, достиг возраста \(animal.age) лет - и был удален из заповедника")
                        // показываем текущий состав заповедника
                        reserve.show()
                        // Если заповедник пуст программа прерывается и выводится сообщение
                        if natureReserve.isEmpty {
                            print("Все животные исчезли. Заповедник закрывается")
                            return
                        }
                        // прекращаем выполнение цикла outerLoop
                        break outerLoop
                    }
                    // показываем текущий состав заповедника
                    reserve.show()
                default:
                    // Если животное слишком старое то прекращаем выполнение цикла outerLoop
                    if animal.isTooOld {
                        break outerLoop
                    // Если возраст позволяет, то выполняем метод рождения детеныша
                    } else {
                        animal.birth()
                        // После рождения добавляем детеныша в массив заповедника
                        natureReserve.append(animal)
                        // показываем текущий состав заповедника
                        reserve.show()
                    }
                }
            }
        }
    }
}
// Инициализируем заповедник
let reserve = NatureReserve()
// Создаем 5 экземпляров птиц
let eagle = Bird(energy: 50, weight: 30, age: 19, maxAge: 20, name: "Орел")
let sparrow = Bird(energy: 10, weight: 16, age: 4, maxAge: 5, name: "Воробей")
let crow = Bird(energy: 20, weight: 10, age: 9, maxAge: 10, name: "Ворона")
let peacock = Bird(energy: 15, weight: 16, age: 14, maxAge: 15, name: "Павлин")
let parrot = Bird(energy: 9, weight: 10, age: 24, maxAge: 25, name: "Попугай")
// Создаем 3 экземпляра рыбы
let pike = Fish(energy: 30, weight: 20, age: 32, maxAge: 33, name: "Щука")
let perch = Fish(energy: 25, weight: 10, age: 22, maxAge: 23, name: "Окунь")
let carp = Fish(energy: 15, weight: 15, age: 11, maxAge: 12, name: "Карась")
// Создаем 2 экземпляра собак
let husky = Dog(energy: 60, weight: 20, age: 14, maxAge: 15, name: "Хаски")
let shepherd = Dog(energy: 50, weight: 30, age: 11, maxAge: 12, name: "Овчарка")
// Создаем 3 экземпляра обычных животных
let rabbit = Animal(energy: 20, weight: 2, age: 9, maxAge: 10, name: "Кролик")
let lion = Animal(energy: 50, weight: 100, age: 19, maxAge: 20, name: "Лев")
let elephant = Animal(energy: 30, weight: 1000, age: 69, maxAge: 70, name: "Слон")

// Добавляем в заповедник животных
reserve.add(element: rabbit)
reserve.add(element: lion)
reserve.add(element: elephant)
reserve.add(element: eagle)
reserve.add(element: sparrow)
reserve.add(element: crow)
reserve.add(element: peacock)
reserve.add(element: parrot)
reserve.add(element: pike)
reserve.add(element: perch)
reserve.add(element: carp)
// Посмотрим сколько животных в заповеднике в начале жизненного цикла
reserve.show()
// Начинаем жизненный цикл
reserve.liveCycle()
