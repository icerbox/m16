//
//  SecondViewController.swift
//  8_2
//
//  Created by Айсен Еремеев on 17.10.2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var timeZoneField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.locale = Locale(identifier: "ru_RU")
        datePicker.timeZone = TimeZone.init(identifier: "UTC")
        // Т.к. стили datePicker на некоторых версиях iOS отображаются некорректно, ставим условие и в зависимости от версии iOS меняем стиль отображения
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.automatic
        }
        timeZoneField.placeholder = "Введите часовой пояс в формате UTC+X или число"
    }
    // Объявляем метод при изменении датапикера
   @IBAction func datePickerChanged(_ sender: UITextField) {
        // Объявляем переменную dateFormatter и присваиваем классу DateFormatter()
        let dateFormatter = DateFormatter()
        // Устанавливаем русскую локаль
        dateFormatter.locale = Locale(identifier: "ru_RU")
        // Указываем формат отображения даты
        dateFormatter.dateFormat = "HH:mm, dd-MM-yyyy, ZZZZZ"
        // Объявлявем переменную strDate которой назначаем дату из датыпикера преобразованную в текст
        let strDate = dateFormatter.string(from: datePicker.date)
        // Назначаем лейблу полученную строку
        dateLabel.text = strDate
    }
    
    // Объявляем метод при изменении текстового поля timeZoneChanged
    @IBAction func timeZoneChanged(_ sender: UITextField) {
        // Объявляем переменную dateFormatter и присваиваем классу DateFormatter()
        let dateFormatter = DateFormatter()
        // Устанавливаем русскую локаль
        dateFormatter.locale = Locale(identifier: "ru_RU")
        // Объявляем переменную IntTimeZone которая будет равна числовому значению текстового поля timeZoneField. Она нам будет нужна для проверки ввода пользователя если он введет простое число
        let IntTimeZone = Int(timeZoneField.text!)
        // Объявляем переменную data которая будет равна значению текстового поля
        let data = timeZoneField.text!
        // Если пользователь выбрал дату и время из датапикера и лейбл не пуст, если пользователь ввел знак + или - и простое число, то дополняем его введенное значение чтобы получился корректный часовой пояс
        if dateLabel.text! != "DD/MM/YY HH:MM" && IntTimeZone != nil && data.count == 2 {
            dateFormatter.timeZone = TimeZone(identifier: "UTC\(timeZoneField.text!)")
        // Если пользователь выбрал дату и время из датапикера и лейбл не пуст, если пользователь ввел число и длина поля равна 1, то дополняем его введенное значение чтобы получился корректный часовой пояс”
        } else if dateLabel.text! != "DD/MM/YY HH:MM" && IntTimeZone != nil && data.count == 1 {
            dateFormatter.timeZone = TimeZone(identifier: "UTC+\(timeZoneField.text!)")
        // Если пользователь ввел например UTC+3 то обрабатываем как обычно
        } else if dateLabel.text! != "DD/MM/YY HH:MM" {
            dateFormatter.timeZone = TimeZone(identifier: "\(timeZoneField.text!)")
        // В противном случае выводим в консоль сообщение об ошибке
        } else {
            print("Введите корректные данные")
        }
        // Указываем формат выводимой даты
        dateFormatter.dateFormat = "HH:mm, dd-MM-yyyy, ZZZZZ"
        // Преобразовываем в формат Date текстовую дату из лейбла с учетом введенного в текстовое поле часового пояса. Так как значение лейбла является опционалом, то раскрываем его
        if let newDate = dateFormatter.date(from: dateLabel.text!) {
        // Преобразовываем обратно в строковую переменную
            let string = dateFormatter.string(from: newDate)
            // Полученную строку назначаем обратно в лейбл
            dateLabel.text = string
        // Если возвращает nil, то выводим в консоль сообщение об ошибке
        } else {
            print("Выберите из датапикера дату и время")
        }
    }
    
}
