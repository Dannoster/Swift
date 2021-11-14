//
//  MyProfileBookListCell.swift
//  Pickabook
//
//  Created by Даниил Найко on 14.11.2021.
//

import Foundation
import UIKit
import PinLayout

class BookListTableViewCell: UITableViewCell {
        
    //struct Book {
    //    var bookImages: [UIImage] = []
    //    var bookName: String
    //    var bookAuthor: String
    //    var bookGenreId: Int
    //    var bookCondition: Int
    //    var bookDescription: String?
    //    var bookLanguage: String
    
    let bookImage = UILabel() //= UIImage() //need repair
    let bookNameLabel = UILabel()
    let bookAuthorLabel = UILabel()
    let bookConditionLabel = UILabel()
    
    let bookConditionIcon  = UILabel() //= UIImage() //need repair
    
    //let view = UIView()
    
    func configure(with book: Book) {
        //bookImage = book.bookImages[0] //need repair
        bookNameLabel.text = book.bookName
        bookAuthorLabel.text = book.bookAuthor
        //bookConditionLabel.text = String(book.bookCondition) //can be added (look comments down)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        bookImage.backgroundColor = UIColor.purple
        bookImage.layer.cornerRadius = 20
        bookImage.layer.masksToBounds = true
        contentView.addSubview(bookImage)
        
        bookNameLabel.font = bookNameLabel.font.withSize(16)
        contentView.addSubview(bookNameLabel)
        
        bookAuthorLabel.font = bookAuthorLabel.font.withSize(14)
        contentView.addSubview(bookAuthorLabel)
        
//        bookConditionLabel.textAlignment = .center
//        bookConditionLabel.font = bookConditionLabel.font.withSize(12)
//        //bookConditionLabel.text = "4.6"
//        contentView.addSubview(bookConditionLabel)

//        bookConditionIcon.backgroundColor = UIColor.yellow
//        contentView.addSubview(bookConditionIcon)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        bookImage.pin
            .top(10)
            .left(10)
            .size(80)
        
        bookNameLabel.pin
            .top(26)
            .right(of: bookImage, aligned: .top).marginLeft(10)
            .height(20)
            .right(10)
        
        bookAuthorLabel.pin
            .below(of: bookNameLabel).marginTop(8)
            .right(of: bookImage, aligned: .top).marginLeft(10)
            .height(20)
            .right(10)

//        bookConditionLabel.pin
//            .below(of: bookAuthorLabel)
//            .right(of: bookImage).marginLeft(10)
//            .size(20)

//        bookConditionIcon.pin
//            //.bottomRight()
//            .below(of: bookAuthorLabel)
//            .right(of: bookConditionLabel)
//            .size(20)
        
    }

}
