import UIKit

// массивы

//var someInts: [Int] = []
//
//var someDoubles = [Double?]()
//
//someInts.count
//
//someInts.isEmpty
//
//print(someInts.isEmpty)
//
//var threeDoubles = Array(repeating: 0.0, count: 3)
//
//var names = ["Alice", "Bob", "Christy"]
//
//for name in names {
//    print(name)
//}
//
//print(names)
//print(names[2])
//
//names.insert("Tom", at: 1)
//print(names)
//
//var names2 = names
//names2.insert("Tom", at: 1)
//print(names)
//print(names2)

// Доступ к элементам массивов

//var shoppingList: [String] = ["Milk", "Eggs", "Bread", "Lemon", "Sugar"]
//
//shoppingList += ["Baking Powder"]
//
//var firstItem = shoppingList[0]
//
//shoppingList[0] = "Six eggs"
//
//shoppingList
//
//shoppingList[3...5] = ["Bananas", "Apples"]
//
//shoppingList
//
//shoppingList.insert("Maple Syrup", at: 0)
//
//let mapleSyrup = shoppingList.remove(at: 0)
//
//let apples = shoppingList.removeLast()

// Операции над массивами

var shoppingList: [String] = ["Milk", "Eggs", "Bread", "Lemon", "Sugar"]

// работа в цикле
for (index, value) in shoppingList.enumerated() {
    print("индекс - \(index), значение \(value)")
}

var array = [1,2,3,4,5,6]
// сортировка
array.sort(by: {$0 > $1})
array

// фильтрация
let filtered = array.filter({$0 % 2==0 })
filtered

// преобразование массива
let newArray = array.map({$0 * $0})
newArray

let array2 = array + array

// Замыкания

let sortingClosure: (String, String) -> Bool = { $0 > $1 }

var names = ["Alice", "Bob", "Christy"]

let reversedNames = names.sorted(by: sortingClosure)

print(reversedNames)

var someVar = 3
var onButtonPressed: ()-> Void = {}

func closureSetter( _ closure: @escaping ()->()) {
    onButtonPressed = closure
    print("Closure is set")
}

closureSetter() { someVar += 1 }

// замыкание только присвоено, но не вызвано
print("someVar is \(someVar)")

// вызов замыкания, например по нажатию кнопки
onButtonPressed()

// замыкание отработало
print("someVar is \(someVar)")


// Работа с множествами

var fruits: Set = ["apple", "banana", "orange"]

let result = fruits.insert("grape")
print(result)

fruits.isEmpty
fruits.count

let cappuccino:Set = ["espresso", "milk", "milk foam"]
let americano:Set = ["espresso", "water"]
let machiato:Set = ["espresso", "milk foam"]
let latte:Set = ["espresso", "milk"]

let unionResult = machiato.union(latte)

let substractingResult = cappuccino.subtracting(americano)
print(substractingResult)

let intersectionResult = latte.intersection(cappuccino)
print(intersectionResult)

let sdResult = latte.symmetricDifference(americano)
print(sdResult)
