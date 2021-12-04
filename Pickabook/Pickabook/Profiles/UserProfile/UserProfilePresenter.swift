//
//  UserProfilePresenter.swift
//  Pickabook
//
//  Created by Даниил Найко on 17.11.2021.
//

import Foundation
//output
protocol UserProfileViewControllerProtocol: AnyObject {
    func presentProfile(profiles: [Profile])
    func presentAlert(title: String, message: String)
    func changeProfileDataView()
}
 
protocol UserProfilePresenterProtocol: AnyObject {
    func didTapTelegramLinkButton()
    func didTapInstagramLinkButton()
}
 
 
final class UserProfilePresenter: UserProfilePresenterProtocol {
    
    weak var view: UserProfileViewControllerProtocol?
    
    func didTapTelegramLinkButton() {
        self.view?.changeProfileDataView()
    }
    
    func didTapInstagramLinkButton() {
        self.view?.changeProfileDataView()
    }
    
}
