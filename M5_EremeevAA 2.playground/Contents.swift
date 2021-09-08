import UIKit

//Задание 1
//Напишите функцию, которая возвращает сумму первых двух элементов массива, поданного на вход. Массив состоит из целых чисел. Должны выполняться следующие условия:
//
//Если размер массива меньше двух элементов, то отсутствующие элементы считать равными 0.
//Проверьте вашу функцию, передав в неё пустой массив и массив из одного элемента.
func sumOfNumbers (_ array: inout [Int]) -> Int {
    var sum = 0
    if array.count < 2 {
        array.insert(0, at: 1)
    }
    for (currentIndex, currentElement) in array.enumerated() {
        
        if currentIndex < 2 {
            sum = sum + currentElement
        }
        else {
            continue
        }
    }
    return sum
}

sumOfNumbers([1,2,3,4,5])
