import UIKit

//Дополнительные задания:

//1. Прочитать по ссылке про роли UIViewController https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/index.html#//apple_ref/doc/uid/TP40007457-CH2-SW1
// Ответ: Прочитано

// 2. Каких типов бывают UIViewController?
// Ответ: Есть два типа  UIViewController'ов: 1. Content view controller - управляет отдельной частью содержимого приложений и является главным типом вьюконтроллеров; 2. Container view controller собирает информацию из других вьюконтроллеров (известных как child view controller) и отображает таким образом, чтобы облегчить навигацию.

// 3. Какие роли выполняет UIViewController?
// Класс UIViewController определяет методы и свойства для управления вьюшками, обрабатывает события, переходы с одного вьюконтроллера на другой, и выполняет их координацию с остальной частью приложений.

// 4. Перечислите основные встроенные Container и Content ViewControllers. Можно воспользоваться ссылкой на документацию
// Основные встроенные
// 1) Container ViewControllers: UISplitViewController, UINavigationController, UINavigationBar, UINavigationItem, UITabBarController, UITabBar, UITabBarItem UIPageViewController;
// 2) Content ViewControllers: UIViewController, UITableViewController, UICollectionViewController, UIContentContainer

// 5. Реализовать Container ViewController.
//
//https://developer.apple.com/documentation/uikit/view_controllers/creating_a_custom_container_view_controller
//
// Вверху панель управления дочерними контроллерами.
//
// При нажатию на кнопку изменяется состояние кнопки с вкл на выкл или наоборот. В соответствии с состоянием должен показываться или скрываться контроллер, соответствующий кнопке.
//
// Контроллеры занимают все оставшееся полезное пространство поровну.
//
// Если все контроллеры выключены, должна быть возможность для пользователя этого Container ViewController указать контроллер заглушку.
//
// Контроллеров и кнопок соответственно может быть не более 6 штук.
//
// Добавил скрин-пример с контейнер контроллером, который управляет показом/скрытием 2ух контент контроллеров.
//
//https://go.skillbox.ru/media/files/c000682f-41b5-4b7f-84d0-a016ba8df9fc/Без_названия.png

// Ответ: Реализовано в проекте m7_2, выложено в github

// 6. Привести любой пример использования UIPageViewController.

// Например при реализации приложения для просмотра электронных книг.
