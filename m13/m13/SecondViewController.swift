
import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func SecondLevelButton2(_ sender: Any) {
        // Создаем экземпляр класса UIAlertController
        let lastPageAlert = UIAlertController(title: "Это последняя страница", message: "Вы хотите вернуться назад?", preferredStyle: UIAlertController.Style.alert)
        lastPageAlert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action: UIAlertAction!) in
            // Если пользователь выбирает вариант "Да", то открываем первую страницу таббарконтроллера
            self.tabBarController?.selectedIndex = 0
        }))
        lastPageAlert.addAction(UIAlertAction(title: "Остаться", style: .cancel, handler: { (action: UIAlertAction!) in
            // в противном случае выводим сообщение в консоль и ничего не предпринимаем
            print("Остаемся на текущем экране")
        }))
        // запускаем предупреждение
        present(lastPageAlert, animated: true, completion: nil)
    }
    
}
