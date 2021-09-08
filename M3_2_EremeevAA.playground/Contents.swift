import UIKit

//Дополнительные задачи:

//1. Создать массив чисел и любое число.
//Проверить есть ли это число в массиве.
//Если число есть, то вывести в консоль строку "Присутствует", если нет - "Отсутствует".
let arrayOfInt = [1,2,3,4,5,6,7,8,9,10] // Объявляем массив с набором целых чисел
func findNumber(_ number: Int) { // Создаем функцию для нахождения искомого числа в массиве arrayOfInt
    for (currentIndex, currentElement) in arrayOfInt.enumerated() {  // Используем цикл for-in для итерации по массиву. Так как нам будут нужны индексы, используем для массива метод enumerated(). currentIndex - текущий индекс элемента. currentElement - текущий элемент массива.
        guard currentElement != number && currentIndex !=  arrayOfInt.count else { //Если текущий элемент не равен входящему аргументу и текущий индекс элемента не последний, то продолжаем выполнение кода за фигурными скобками
            print("Присутствует") // В противном случае выводим сообщение что элемент присутствует
            break // Прекращаем выполнение цикла
        }
        // Продолжение guard'a--->
        if currentElement != number && currentIndex == arrayOfInt.count - 1 { // Если текущий элемент не равен входящему аргументу и текущий индекс последний, то выводим сообщение, что элемент отсутствует
            print("Отсутствует")
            break // Прекращаем выполнение цикла
        }
    }
}

findNumber(10) // Проверка 1. Должна вывести "Присутствует"
findNumber(0) // Проверка 2. Должна вывести "Отсутствует"

//2. Создать массив строк и любую строку.
//Проверить есть ли эта строка в массиве.
//Если строка есть, то вывести в консоль строку "Присутствует", если нет - "Отсутствует".

let arrayOfStrings = ["Раз","Два","Три","Четыре","Пять","Шесть","Семь","Восемь","Девять"] // Объявляем массив с набором строк
func findString(_ string: String) { // Создаем функцию для нахождения искомой строки в массиве arrayOfStrings
    for (currentIndex, currentElement) in arrayOfStrings.enumerated() {  // Используем цикл for-in для итерации по массиву. Так как нам будут нужны индексы, используем для массива метод enumerated(). currentIndex - текущий индекс элемента. currentElement - текущий элемент массива.
        // print("Проверяем элемент \(currentElement)")
        guard currentElement != string && currentIndex !=  arrayOfStrings.count else { //Если текущий элемент не равен входящему аргументу и текущий индекс элемента не последний, то продолжаем выполнение кода за фигурными скобками
            print("Присутствует") // В противном случае выводим сообщение что элемент присутствует
            break // Прекращаем выполнение цикла
        }
        // Продолжение guard'a--->
//        print(currentIndex, currentElement)
        if currentElement != string && currentIndex == arrayOfStrings.count - 1 { // Если текущий элемент не равен входящему аргументу и текущий индекс последний, то выводим сообщение, что элемент отсутствует
            print("Отсутствует")
            break // Прекращаем выполнение цикла
        }
    }
}

findString("Восемь") // Должно вывести присутствует
findString("Ноль") // Должно вывести отсутствует

//3. Создать массив строк и любую строку.
//Если строка в массиве есть, то вывести в консоль индекс этой строки в массиве.

let arrayOfStrings2 = ["Раз","Два","Три","Четыре","Пять","Шесть","Семь","Восемь","Девять"] // Объявляем массив с набором строк
func findIndexOfString(_ string: String) {
    for (currentIndex, currentElement) in arrayOfStrings2.enumerated() {
        guard currentElement != string && currentIndex !=  arrayOfStrings2.count else {
            print("Текущий индекс искомой строки: \(currentIndex)")
            break
        }
        if currentElement != string && currentIndex == arrayOfStrings2.count - 1 {
            print("Отсутствует")
            break
        }
    }
}
findIndexOfString("Пять") // Должно вывести 4

//4. Создать массив чисел.
//Если число из массива делится на 3, то вывести в консоль строку "Число \(значение числа) делится на 3".

let arrayOfInt2 = [1,2,3,4,5,6,9,12]
func divideByThree() {
    for i in arrayOfInt2 {
        if i%3 == 0 {
            print("Число \(i) делится на 3")
        }
    }
}

divideByThree()

//5. Создать массив чисел.
//Если число из массива делится на 2, то вывести в консоль строку "Число \(значение числа) делится на 2", а если делится и на 2 и на 5, то вывести в консоль строку "Число \(значение числа) делится на 2 и на 5".

let arrayOfInt3 = [1,2,4,5,10]
func divideByNumbers() {
    for i in arrayOfInt3 {
        if i%2 == 0 {
            print("Число \(i) делится на 2")
        }
        if i%2 == 0 && i%5 == 0 {
            print("Число \(i) делится на 2 и на 5")
        }
    }
}

divideByNumbers()

//6. Создайте массив чисел и найдите произведение всех чисел в нем.

var arrayForMult = [1,2,3,4,5]
var result = 1
func multNumbers() {
    for i in arrayForMult {
        result = result * i
    }
    print("Произведение всех чисел в массиве \(result)")
}


multNumbers() // Должно вывести в консоль 120


//7. Создайте массив с отрицательными и положительными числами и найдите сумму только положительных чисел.

var array7 = [1, -1, 2, -2, 3, -3, 4, -4]
var sum = 0
func posNumSum() {
    for i in array7 {
        if i < 0 {
            continue
        }
        else if i > 0 {
            sum = sum + i
        }
    }
    print("Сумма положительных чисел равна: \(sum)")
}

posNumSum() // Должно вывести 10

// 8. Создайте массив имен и выведет в консоль каждый элемент с его индексом.
let array8 = [1,2,3,4,5,7,8,0]
func showAllElements() {
    for (currentIndex, currentElement) in array8.enumerated() {
    print("У элемента \(currentElement)", "Индекс: \(currentIndex)")
    }
}
showAllElements()

//9. Создайте массив чисел.
//Найдите сумму всех чисел по правилам:
//- если число входит в промежуток от 0 до 100, то умножьте это число на два
//- от 100 до 200, на 3
//- от 200 до 300, на 4
//- в остальных случаях число оставьте неизменным.
//Интервалы нестрогие, то есть правая граница не включается.
//Например, для интервала от 200 до 300, число 300 не включается.

let array9 = [50, 101, 202, 500]
sum = 0
func multByRules() {
    for element in array9 {
        if element >= 0 && element < 100 {
            sum = sum + element * 2
        }
        else if element >= 100 && element < 200 {
            sum = sum + element * 3
        }
        else if element >= 200 && element < 300 {
            sum = sum + element * 4
        }
        else {
            sum = sum + element
        }
    }
        print(sum)
}
multByRules() // Должно вывести число 1711
