import UIKit
import Foundation

//Задание 1
//Напишите функцию, которая возвращает сумму первых двух элементов массива, поданного на вход. Массив состоит из целых чисел. Должны выполняться следующие условия:
//
//Если размер массива меньше двух элементов, то отсутствующие элементы считать равными 0.
//Проверьте вашу функцию, передав в неё пустой массив и массив из одного элемента.

func sumOfFirstTwo (_ array: [Int]) -> Int {
    // Объявляем счетчик суммы чисел и присваиваем значение 0
    var sum = 0
    // Если размер массива меньше двух элементов (в том числе если массив пустой), то возвращаем 0
    if array.count < 2 {
        return 0
    } else {
        // В ином случае, создаем новый массив firstTwoArray который содержит первые два элемента массива array.
        let firstTwoArray = array.prefix(2)
        // Далее суммируем оба полученных числа массива
        for i in firstTwoArray {
            sum += i
        }
    }
    return sum
}

sumOfFirstTwo([1]) // Возвращает 0
sumOfFirstTwo([]) // Возвращает 0
sumOfFirstTwo([5,4,3,4,5]) // Возвращает 9

//Задание 2
//Напишите функцию, которая возвращает массив, состоящий из первого и последнего элемента поданного на вход массива. Массив состоит из целых чисел. Должны выполняться следующие условия:
//
//Если длина введенного массива меньше 2, то функция должна возвратить nil.
//Проверьте вашу функцию, передав в неё пустой массив и массив из одного элемента.
//Подсказка: используйте конструкцию guard для проверки длины массива.

func showFirstAndLast (_ array: [Int]?) -> [Int]? {
    // Т.к. поданный на вход массив опциональный, то раскрываем опционал.
    if let array = array { // если опциональный массив array не пустой, выполняем строки до конструкции else
        guard array.count >= 2 else { // при помощи конструкции guard проверяем длину массива. Если длина массива больше или равно 2, то продолжаем выражение за фигурными скобками. Если нет, то возвращаем nil
            return nil
        }
        let firstElement = array.prefix(1) // объявляем константу firstElement которой при помощи метода prefix назначаем первый элемент массива
        let firstArray = Array(firstElement) // добавляем полученный элемент в массив firstArray
        let lastElement = array.suffix(1) // объявляем константу lastElement, которой при помощи метода suffix назначаем последний элемент массива
        let lastArray = Array(lastElement) // добавляем полученный элемент в массив lastArray
        let newArray = firstArray + lastArray // объявляем константу newArray в который конкатенируем два полученных массива
        return newArray // возвращаем полученный массив
    } else { //если опциональный массив пустой то возвращаем nil
        return nil
    }
}
showFirstAndLast([1,2,3,4,5])
showFirstAndLast([1])
showFirstAndLast([])

//Задание 3
//Напишите код, состоящий из переменной, которой присвоено замыкание для фильтрации массива. С помощью этого замыкания должны быть отфильтрованы значения меньше 5. Передайте эту переменную в качестве аргумента функции высшего порядка .filter(_ :). Эта функция должна быть применена к массиву — [1.5, 10, 4.99, 2.30, 8.19].
//
//Должны выполняться следующие условия:
//
//Замыкание должно иметь входной параметр типа Double, а выходной — Bool.
//Результат с отфильтрованными значениями должен быть выведен в консоль.

var array = [1.5, 10, 4.99, 2.30, 8.19] // Объявляем массив array

let filterByFive = array.filter { $0 >= 5} // с помощью замыкания фильтруем значения меньше 5

print(filterByFive) // выводим результат

//Задание 4
//Напишите код, в котором с помощью цикла for in преобразуйте массив дат(Date) в массив строк с датами. Должны выполняться следующие условия:
//
//Массив дат создайте сами, даты должны быть разные.
//В этом задании нельзя использовать функции высшего порядка, только цикл.
//Формат дат должен быть следующим: yyyy- MM-dd HH:mm:ss.
//Выведите результат в консоль.

let date = Date()  // объявляем константу date которому назначаем текущую дату
let dateFormatter = DateFormatter() // создаем объект DateFormatter()
// При помощи компонента dateFormat устанавливаем формат даты
dateFormatter.dateFormat = "yyyy- MM-dd HH:mm:ss"

// Формируем массив дат воспользовавшись компонентом Calendar и добавляя по 10 дней к текущей дате

var value1 = DateComponents(calendar: Calendar.current, year: 2021, month: 7, day: 1)
print(value1.date!)

let arrayOfDates: [Date] = [
    Calendar.current.date(byAdding: .day, value: 10, to: date)!,
    Calendar.current.date(byAdding: .day, value: 20, to: date)!,
    Calendar.current.date(byAdding: .day, value: 30, to: date)!,
    Calendar.current.date(byAdding: .day, value: 40, to: date)!
]

// Объявляем пустой массив arrayOfStringDates для хранения строковых дат
var arrayOfStringDates: [String] = []

// При помощи цикла перебираем каждую дату в массиве arrayOfDates
for i in arrayOfDates {
    // объявляем переменную stringDate которой при помощи интерполяции присваиваем текстовое значение текущего значения массива.
    var stringDate = "\(i)"
    // Полученная строковая дата у нас такого вида: 2021-06-30 15:00:00 +0000, где +0000 у нас лишние знаки. Я не понял как удалить эти лишние значения по-другому, поэтому ввел диапазон range
    let range = stringDate.index(stringDate.endIndex, offsetBy: -6)..<stringDate.endIndex
    // удаляем указанный диапазон строковых символов и в итоге получаем то что нам надо
    stringDate.removeSubrange(range)
    stringDate
//Далее при помощи конкатенации добавляем в пустой массив arrayOfStringDates отформатированную константу stringDate
    arrayOfStringDates += [stringDate]
}

// выводим готовый массив в консоль
print(arrayOfStringDates)

//Задание 5
//Выполните задание 5 с помощью функции высшего порядка для преобразования массива, чтобы превратить массив дат в массив строк. Остальные условия остались прежними.

var arrayOfStringDates2: [String] = []

// При помощи метода forEach перебираем каждую дату в массиве arrayOfDates
arrayOfDates.forEach { i in
    // объявляем константу stringDate которой при каждой итерации цикла присваиваем новое значение даты из массива arrayOfDates.
    let stringDate = dateFormatter.string(from: i)
    // при помощи функции высшего порядка append
    arrayOfStringDates2.append(stringDate)
}

print(arrayOfStringDates2)

//Задание 6
//Напишите код, в котором вы найдёте пересечение двух множеств с использованием Set и его методов. Создайте два множества: один с нечётными числами — [5,7,8,9,11,13], второй с простыми числами — [2,3,5,7].
//
//Должны выполняться следующие условия: результат должен выводиться в консоль.

// Объявляем два множества с неявным указанием типа данных
let set1: Set = [5,7,8,9,11,13]
let set2: Set = [2,3,5,7]
// Объявляем константу interSet к которой при помощи метода intersection присваиваем все общие элементы двух множеств
let interSet = set2.intersection(set1)
// Выводим результат в консоль
print(interSet)
