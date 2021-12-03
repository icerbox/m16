//
//  ViewController.swift
//  8_2
//
//  Created by Айсен Еремеев on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var progressVIew: UIProgressView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stepper.setIncrementImage(UIImage(named: "next"), for: UIControl.State.normal)
        stepper.setDecrementImage(UIImage(named: "previous"), for: UIControl.State.normal)
    }
    
    // Объявляем массив в котором содержатся 10 изображений добавленных в папку assets
    let array: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!,
        UIImage(named: "image5")!,
        UIImage(named: "image6")!,
        UIImage(named: "image7")!,
        UIImage(named: "image8")!,
        UIImage(named: "image9")!,
        UIImage(named: "image10")!
    ]

    // Объявляем счетчик i для текущей позиции в массиве изображений
    var i: Int = 0
    // Объявляем таймер который будем использовать для определения текущего изображения для остановки по кнопке стоп
    var timer: Timer?
    // Объявляем счетчик для позиции текущего изображения в массиве array
    var currentImage: Int = 0
    // Метод для кнопки назад
    
    @IBAction func Back(_ sender: UIButton) {
        // Чтобы работала обратная прокрутка, проверяем счетчик на 0, если это так то добавляем 9 и равняем счетчик остатку от деления на размер массива 0+9/10=9.
        if i == 0 {
            i = (i + 9)%array.count
            // делаем проверку на текущую позицию счетчика
            print(i)
            // выводим изображение с текущей позицией на UIImageView
            imageView.image = array[i]
        } else {
            // В противном случае вычитаем 1 и равняем счетчик остатку от деления на размер массива. Например если i = 9 то (9 - 1)%10 = 8, (8 - 1)%10 = 7 и т.д.
            i = (i - 1)%array.count
            // делаем проверку на текущую позицию
            print(i)
            // выводим изображение с текущей позицией на UIImageView
            imageView.image = array[i]
        }
    }

    
    // Метод для кнопки вперед
    
    @IBAction func Next(_ sender: UIButton) {
        // Для прокрутки вперед увеличиваем на 1 и равняем счетчик остатку от деления на размер массива.
        i = (i + 1)%array.count
        // делаем проверку на текущую позицию
        print(i)
        // выводим изображение с текущей позицией на UIImageView
        imageView.image = array[i]
    }
    
    // Метод для кнопки старт
    @IBAction func Start(_ sender: UIButton) {
        // Указываем изображения для прокрутки из массива
        imageView.animationImages = array
        // Устанавливаем общее время цикла на все изображения равным 20 секундам
        imageView.animationDuration = 20.0
        // Повторяем анимацию бесконечно
        imageView.animationRepeatCount = 0
        // Начинаем показ слайдов с первого изображения
        imageView.image = imageView.animationImages?.first
        // Запускаем прокрутку изображений
        imageView.startAnimating()
        // Для отслеживания текущего изображения объявляем таймер. Интервал счетчика делаем равным значению animationDuration на длину массива array. В качестве селектора указываем метод updateImageCount в котором при каждом обращении увеличиваем счетчик currentImage на 1.
        timer = Timer.scheduledTimer(timeInterval: imageView.animationDuration/Double(array.count), target: self, selector: #selector(updateImageCount), userInfo: nil, repeats: true)
    }
    
    // Метод который увеличивает счетчик позиции на 1 при каждой итерации таймера
    @objc func updateImageCount() {
        // Объявляем счетчик currentImage который будем использовать для отслеживания текущего изображения в массиве для остановки
        currentImage = currentImage + 1
        // Добавляем условие на случай если прокрутка изображений начнется заново. Если счетчик текущего изображения равен длине массива, то сбрасываем счетчик на 0 и перезапускаем наш таймер заново
        if currentImage == array.count {
            timer?.invalidate()
            currentImage = 0
            timer = Timer.scheduledTimer(timeInterval: imageView.animationDuration/Double(array.count), target: self, selector: #selector(updateImageCount), userInfo: nil, repeats: true)
        }
        // Назначаем значение прогрессвью равным остатку от деления значения счетчика currentImage на размер длину массива array
        progressVIew.progress = (Float(currentImage)/Float(array.count))
        // проверяем текущее значение счетчика текущего изображения
        print(currentImage)
    }
    // Метод для кнопки Стоп
    
    @IBAction func Stop(_ sender: UIButton) {
        // Устанавливаем изображение по умолчанию для imageView равным элементу массива с текущим счетчиком
        imageView.image = array[currentImage]
        // Останавливаем анимацию
        imageView.stopAnimating()
        // останавливаем таймер
        timer?.invalidate()
        // проверяем изображение на котором остановились
        print("Номер изображения на котором остановлен просмотр: Изображение № \(currentImage + 1)")
        // обнуляем счетчик
        currentImage = 0
    }
    // Объявляем метод, который при изменении значения UISlider будет менять изображение в imageView
    func slideImages() {
        imageView.image = array[Int(slider.value)]
    }
    // При прокрутке слайдера запускаем метод slideImages для смены изображений
    @IBAction func sliderChanged(_ sender: Any) {
        slideImages()
    }
    // При нажатии на кнопки степпера назначаем его значения текущему элементу массива
    @IBAction func stepperClicked(_ sender: UIStepper) {
        imageView.image = array[Int(sender.value)]
    }
    // Объявляем метод для переключения прозрачности imageView
    @IBAction func switchChanged(_ sender: UISwitch) {
        // Если переключатель включен, то меняем прозрачность на 0.3
        if sender.isOn {
            imageView.alpha = 0.3
            // включаем анимацию индикатора активности
            activityIndicator.startAnimating()
        // Если выключен меняем на 1.0
        } else {
            imageView.alpha = 1.0
            // Выключаем анимацию индикатора активности
            activityIndicator.stopAnimating()
        }
    }
    
}
