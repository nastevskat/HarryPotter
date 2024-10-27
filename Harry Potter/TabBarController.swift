import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let booksVC = BooksListViewController()
        booksVC.title = "Books"
        booksVC.tabBarItem = UITabBarItem(title: "Books", image: UIImage(systemName: "book"), tag: 0)

        let charactersVC = CharactersListViewController()
        charactersVC.title = "Characters"
        charactersVC.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.2"), tag: 1)

        viewControllers = [UINavigationController(rootViewController: booksVC),
                           UINavigationController(rootViewController: charactersVC)]
    }
}
