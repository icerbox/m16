import UIKit
import Foundation

//Задание 1
//Создайте словарь, содержащий название дня недели и его номер:
//
//«Понедельник» — 1.
//«Вторник» — 2.
//«Среда» — 3.

var weeks = [1: "Понедельник", 2: "Вторник", 3: "Среда"]

//Задание 2
//Добавьте в словарь ещё одну запись — «Четверг».

weeks[4] = "Четверг"

//Задание 3
//С помощью итерации выведите названия всех дней недели и их номеров.
//
//Вывод должен осуществляться в консоль. Пример вывода: «Четверг — 4».

for (key, value) in weeks {
    print("\(key): \(value)")
}

//Задание 4
//
//Выше приведён код, в котором объявляется новый тип ошибки с помощью enum. Добавьте в него ещё один случай ошибки. Назовите его notFound. Не забудьте добавить описание ошибки для нового случая в соответствующий метод.

enum CustomError: Error, LocalizedError {
    case invalidPassword
    case notFound
    
    public var errorDescription: String? {
        switch self {
        case .invalidPassword:
            return "Неправильный пароль"
        case .notFound:
            return "Сервер не может найти данные, соответствующие вашему запросу"
        }
    }
}

//Задание 5
//Напишите функцию, которая будет выкидывать созданную вами ошибку из предыдущего задания. Должны выполняться следующие условия:
//
//Функция называется throwsError.
//Параметр функции назван needsError, тип параметра — Bool.
//Функция выбрасывает ошибку, только если значение параметра true.
//Нельзя использовать return для возвращения ошибки.
//Чтобы вернуть ошибку, используйте название enum, и через точку обратитесь к нужному вам случаю.

func throwsError(needsError: Bool) throws {
    if needsError == true {
        throw CustomError.notFound
    }
}

//Задание 6
//Вызовите функцию throwsError с параметром true и обработайте ошибку, для этого выведите в консоль описание ошибки.
//
//Должны выполняться следующие условия:
//
//Для вывода описания ошибки используйте обращение к свойству error.localizedDescription

func onUserInput(needsError: Bool) {
    do {
        try throwsError(needsError: needsError)
        print(needsError)
    } catch {
        print(error.localizedDescription)
    }
}

onUserInput(needsError: true)
