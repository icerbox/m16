import UIKit

struct Person {
    var name: String
    var age: Int

    // Решение задания 1: Допишите метод в структуре Person, который сравнивает возраст
    func getAgeComparisonString(_ p: Person) -> String {
        // Объявляем пустую строковую переменную в которой будем хранить результат сравнения
        var result = ""
        // Здесь self.age это мой возраст, p.age это возраст сравниваемого который будем вводить в методе
        if self.age < p.age {
            result = "\(p.name) старше меня"
        } else if self.age > p.age {
            result = "\(p.name) моложе меня"
        } else {
            result = "\(p.name) такого же возраста, как и я"
        }
        // возвращаем результат сравнения
        return result
    }
    
    //  Решение задания 2: Добавьте в структуру Person ленивое свойство, которое возвращает человека в виде строки следующего формата {Имя}{Возраст}{года/лет}
    
    lazy var info: String = {
        // Объявлявем пустую строковую переменную в которой будем хранить результат сравнения для вывода
        var info = ""
        // Если возраст 1,2,3,4 или остаток от деления на 10 составляет 1, то склоняем как год
        if age < 5 || age%10 == 1 {
            info = "\(name)" + " " + "\(age)" + " " + "год"
        // Если возраст больше 4 и меньше 21, остаток от деления на 10 составляет 5, 6, 7, 8, 9 и 0 то склоняем как лет
        } else if age > 4 && age < 21 || age % 10 == 5 || age % 10 == 6 || age % 10 == 7 || age % 10 == 8 || age % 10 == 9 || age % 10 == 0 {
            info = "\(name)" + " " + "\(age)" + " " + "лет"
        // Если остаток от деления на 10 составляем 2, 3, 4 то склоняем как года
        } else if age % 10 == 2 || age % 10 == 3 || age % 10 == 4 {
            info = "\(name)" + " " + "\(age)" + " " + "года"
        }
        return info
    }()
}

// Решение задания 3: Cоздайте класс Hero. Добавьте свойство жизней - lifeCount. Количество жизней задается при создании героя в инициализаторе. Добавьте метод "попадание", который уменьшает количество жизней, - hit()
class Hero {
    // Создаем свойство lifeCount для учета количества жизней
    private var lifeCount: Int
    // Инициализируем свойство
    init(lifeCount: Int) {
        self.lifeCount = lifeCount
    }
    // Решение задания 4: Добавьте в класс Hero вычисляемое свойство, жив или нет герой, - isLive. Если количество жизней больше 0, то возвращает true
    // Объявляем вычисляемое свойство isLive с типом Bool
    var isLive: Bool {
        // если больше нуля возвращаем true
        if lifeCount > 0 {
            return true
            // в противном случае возвращаем false
        } else {
            return false
        }
    }
    
    // Объявляем метод "попадание"
    func hit() -> Int {
        // При запуске метода счетчик количества жизней уменьшается на 1
        lifeCount = lifeCount - 1
        // возвращаем полученное количество жизней
        return lifeCount
    }
}
// Задание 6. Отнаследуйтесь от класса Hero, создав дочерний класс SuperHero. Переопределите метод "попадание" для нового класса так, чтобы SuperHero не получал повреждения

// Объявляем класс SuperHero который наследует класс Hero
class SuperHero: Hero {
    // Т.к. у класса Hero свойство lifeCount имеет уровень доступа private, и к нему нет доступа, объявлявем его заново
    var lifeCount: Int
    // Т.к. подкласс SuperHero имеет совпадающий назначенный инициализатор перед инициализацией пишем модификатор override
    override init(lifeCount: Int) {
        self.lifeCount = lifeCount
        // вызываем дефолтный инициализатор для суперкласса Hero класса SuperHero. Он проверяет, что унаследованное свойство lifeCount инициализировано в Hero, после чего у SuperHero появляется возможность его модифицировать
        super.init(lifeCount: lifeCount)
    }
    // Переопределяем метод hit() и возвращаем текущее значение lifeCount
    override func hit() -> Int {
        return lifeCount
    }
}
// Проверка задания 3
var superman = Hero(lifeCount: 1)
superman.hit()
// Проверка задания 4
superman.isLive
// Проверка задания 1
var p1 = Person(name: "Антон", age: 24)
var p2 = Person(name: "Андрей", age: 36)
var p3 = Person(name: "Ольга", age: 24)

p1.getAgeComparisonString(p2)
p2.getAgeComparisonString(p1)
p1.getAgeComparisonString(p3)
// Проверка задания 2
p1.info
p2.info
p3.info
// Проверка задания 6
var wolverine = SuperHero(lifeCount: 2)
wolverine.hit()
// Проверка задания 4
wolverine.isLive
