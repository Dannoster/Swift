//
//  MainViewController.swift
//  Pickabook
//
//  Created by Ульяна Цимбалистая on 13.11.2021.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let genrePresenter = GenreCollectionViewPresenter()
        let genresVC = UINavigationController(rootViewController: GenreCollectionViewController(output: genrePresenter))
        genresVC.tabBarItem.image = UIImage(named: "SearchViewIcon")
        genresVC.title = ""
        
        let myProfilePresenter = MyProfilePresenter()
        let myProfileViewController = MyProfileViewController(output: myProfilePresenter)
        let myProfileVC = UINavigationController(rootViewController: myProfileViewController)
        myProfilePresenter.view = myProfileViewController
        //let profileVC = MyProfileViewController()
        myProfileVC.tabBarItem.image = UIImage(named: "ProfileViewIcon")
        myProfileVC.title = ""
        
        let favoritesVC = TestFavVC()
        favoritesVC.tabBarItem.image = UIImage(named: "FavViewIcon")
        favoritesVC.title = ""
        
        let addPresenter = AddNewBookPresenter()
        let addViewController = AddNewBookViewController(output: addPresenter)
        let addVC = UINavigationController(rootViewController: addViewController)
        addPresenter.view = addViewController
        addVC.tabBarItem.image = UIImage(named: "AddViewIcon")
        addVC.title = ""
        
        self.setViewControllers([genresVC, favoritesVC, addVC, myProfileVC], animated: false)
        self.modalPresentationStyle = .fullScreen
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
    
    
    class TestProfileVC : UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .systemPurple
            
        }
    }
    
    class TestFavVC : UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .systemPink
        }
    }
    
    class TestAddVC : UIViewController{
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .systemTeal
        }
    }
}
