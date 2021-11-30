//
//  BooksCollectionViewPresenter.swift
//  Pickabook
//
//  Created by Ульяна Цимбалистая on 14.11.2021.
//

import Foundation
import UIKit

protocol BooksCollectionViewPresenterProtocol: AnyObject {
    func loadBooks(genre: Genre) -> [Book]
    func chosedBook(book: Book)
}

final class BooksCollectionViewPresenter: BooksCollectionViewPresenterProtocol {
    weak var delegate : BooksCollectionViewController?
    let books = Util.shared.books
    
    public func setViewDelegate(delegate: BooksCollectionViewController) {
        self.delegate = delegate
    }
    
    func chosedBook(book: Book) {
        delegate?.presentNextVC(selectedBook: book)
    }
    
    func loadBooks(genre: Genre) -> [Book] {
        // здесь будет загрузка книг из бд
        
        let sortedBooks = books.filter({ $0.bookGenres == genre.type })
        return sortedBooks
    }
}
