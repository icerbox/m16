import UIKit

//Задание 1
//Напишите функцию, которая принимает на вход два целых числа и выводит в консоль, равны они или нет. Должны выполняться следующие условия:

//Если первое число равно второму числу, надо вывести в консоль слово «равно».
//Если первое число больше второго, то вывести слово «больше».
//Если первое число меньше, то вывести слово «меньше».

func compare(_ number1: Int, _ number2: Int) {
    if number1 == number2 {
        print("равно")
    }
    else if number1 > number2 {
        print("больше")
    }
    else {
        print("меньше")
    }
}

compare(0,2)

//Задание 2
//Пользователь вводит целое число от 1 до 100 в виде строки String. Напишите функцию, которая проверяет ввод пользователя и возвращает число типа Int.
//
//Если пользователь ввёл вместо числа текст, то нужно вернуть −1 и вывести в консоль слово «Ошибка».
//Если пользователь ввёл число вне диапазона от 1 до 100 включительно, нужно вернуть это число, а в консоль вывести текст (“\(value) вне диапазона”), где value — это число, введённое пользователем.
//В остальных случаях нужно просто вернуть число пользователя Int.
//Подсказка: используйте вызов Int(String) для создания целого числа из строки. Например, Int(“1”) вернёт числовое значение 1.

let userInput: String = "5"

func checkIfElse(_ value: String) -> Int {
    if let newInt = Int(value) {
        if newInt < 1 || newInt > 100 {
            print("\(value) вне диапазона")
            return newInt
        } else {
            return newInt
        }
    } else {
        print("Ошибка")
        return -1
    }
}
func checkGuard(_ value: String) -> Int {
    guard let newInt = Int(value)  else {
        return -1
    }
        guard newInt > 1 || newInt < 100 else {
            return -1
        }
            return newInt
}

checkString(userInput)
checkGuard(userInput)
//Задание 3
//Напишите функцию, которая выводит самый большой элемент в массиве.

//Примеры:

//findLargestNum([4, 5, 1, 3]) возвращает 5

//findLargestNum([300, 200, 600, 150]) возвращает 600

//findLargestNum([1000, 1001, 857, 1]) возвращает 1001

//Подсказка: Используйте синтаксис for in для обработки массива.

func findLargestNum(_ array: [Int]) -> Int {
    var max = 0
    for i in 0...array.count - 1 {
        if (array[i] > max) {
            max = array[i]
            print(max)
        }
    }
    return max
}

findLargestNum([4,5,1,3])
findLargestNum([300, 200, 600, 150])
findLargestNum([1000, 1001, 857, 1])

//Задание 4
//Напишите функцию, внутри которой будет switch для обработки значений одного брошенного кубика. На вход функция получает число от 1 до 6 включительно. Если значение 1, 2 или 3 — нужно вывести в консоль слово «проигрыш». Если значение 4, 5 или 6 — нужно вывести слово «победа». Если число выходит за пределы, выведите сообщение ("У кубика только 6 граней!?"). В задании нельзя использовать if, else и else if.

func cubeSwitcher(_ number: Int) {
    switch number {
    case 1, 2, 3:
        print("проигрыш")
    case 4, 5, 6:
        print("победа")
    default:
        print("У кубика только 6 граней!?")
    }
}

cubeSwitcher(6)
