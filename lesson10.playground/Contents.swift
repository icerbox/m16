import UIKit

// 10.2 Протоколы

//struct Provider: ProviderProtocol {
//    func provideItems() -> [String] {
//        return [
//            "one",
//            "two",
//            "three",
//        ]
//    }
//}
//
//class ProviderMock: ProviderProtocol {
//    var items: [String] = []
//    var providerCallsCount: Int = 0
//
//    init() {}
//
//    func provideItems() -> [String] {
//        providerCallsCount += 1
//        return items
//    }
//}
//
//protocol ProviderProtocol {
//    func provideItems() -> [String]
//}
//
//class ViewModel {
//    let provider: ProviderProtocol
//    init(provider: ProviderProtocol) {
//        self.provider = provider
//    }
//
//    func loadItems() {
//        provider.provideItems()
//    }
//}
//
//let mock = ProviderMock()
//let viewModel = ViewModel(provider: mock)
//viewModel.loadItems()
//
//print(mock.providerCallsCount)

// 10.3. Требования протоколов

// Свойства

//protocol SomeProtocol {
//    var mustBeSettable: Int { get set }
//    var doesNotNeedToBeSettable: Int { get }
//}
//struct SomeStructure: SomeProtocol {
//    var mustBeSettable: Int
//    private(set) var doesNotNeedToBeSettable: Int
//}
//
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//}
//
//protocol FullyNamed {
//    var fullName: String { get }
//}
//
//struct Person: FullyNamed {
//    var fullName: String
//}

// Методы

//protocol SomeProtocolWithMethod {
//    static func someTypeMethod()
//}
//
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//
//protocol Toggable {
//    mutating func toggle()
//}


// Инициализатор

//protocol WithInitProtocol {
//    init(someParameter: Int)
//}
//
//class SomeClass: WithInitProtocol {
//    init() { }
//
//    required init(someParameter: Int) {
//        // реализация
//    }
//}
//
//protocol OneProtocol { }
//protocol TwoProtocol: OneProtocol { }
//
//struct Car: NameProtocol {
//    func getName() -> String {
//        "Car"
//    }
//    let wheelNumber = 4
//}
//
//struct Bird: NameProtocol {
//    func getName() -> String {
//        "Bird"
//    }
//    let name: String
//}
//
//protocol NameProtocol {
//    func getName() -> String
//}
//
//let array: [NameProtocol] = [Car(), Bird(name: "Parrot")]
//
//array.forEach { item in
//    print(item.getName())
//}

// 10.4. Реализация протоколов

//struct SomeStructure: Equatable {
//    let stringValue: String
//    let intValue: Int
//}
//
//let struct1 = SomeStructure(stringValue: "One", intValue: 1)
//let struct2 = SomeStructure(stringValue: "Two", intValue: 1)
//
//
//struct1 == struct2

//struct SomeStructure: Hashable {
//    let stringValue: String
//    let intValue: Int
//}
//
//let struct1 = SomeStructure(stringValue: "One", intValue: 1)
//let struct2 = SomeStructure(stringValue: "Two", intValue: 1)
//
//
//let dictionary: [SomeStructure: String] = [struct1: "One"]

//protocol SomeClassOnlyProtocol: AnyObject {
//
//}
//
//struct SomeStruct: SomeClassOnlyProtocol {
//
//}

//protocol Named {
//    var name: String { get }
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name :String
//    var age: Int
//}
//
//func wishHappyBirthday(to celebrator: Named & Aged) {
//    print("С  Днем рождения, \(celebrator.name)! Тебе уже \(celebrator.age)")
//}
//
//let person = Person(name: "Айсен", age: 39)
//wishHappyBirthday(to: person)

// 10.5 Расширения

//extension String {
//    func firstWord() -> String {
//        let spaceIndex = firstIndex(of: " ") ?? endIndex
//        let word = prefix(upTo: spaceIndex)
//        return String(word)
//    }
//}
//
//let someLongString = "One Two Three"
//print(someLongString.firstWord())

protocol SomeProtocol { }

extension SomeProtocol {
    func sayHi() {
        print("Hi!!")
    }
}

struct SomeStructure: SomeProtocol { }

let someStructure = SomeStructure()
someStructure.sayHi()

//func printDescription() {
//    
//}
//
//protocol StringRepresentable {
//    var stringValue: Int { get }
//}

protocol PersonProtocol {
    var name: String { get }
    func reactOnDanger()
}

extension PersonProtocol {
    func reactOnDanger() {
        print("Help!!!")
    }
}

protocol SuperPowerable {  }

extension PersonProtocol where Self: SuperPowerable {
    func reactOnDanger() {
        print("Use superpowers")
    }
}

struct Person: PersonProtocol, SuperPowerable {
    let name = "John"
}

let person = Person()
person.reactOnDanger()
































