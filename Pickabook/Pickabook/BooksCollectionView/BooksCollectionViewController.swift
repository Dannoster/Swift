//
//  BooksCollectionViewController.swift
//  Pickabook
//
//  Created by Ульяна Цимбалистая on 14.11.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class BooksCollectionViewController: UICollectionViewController {
    let presenter: BooksCollectionViewPresenter!
    let genre: Genre!
    var sortedBooks : [Book]!
    
    init(output: BooksCollectionViewPresenter, genre: Genre){
        self.presenter = output
        self.genre = genre
        
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        
        presenter.setViewDelegate(delegate: self)
        sortedBooks = presenter.loadBooks(genre: genre)
    }
    
    func setCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        let size = CGSize(width:(collectionView!.bounds.width - 30), height: 100)
        layout.itemSize = size
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView!.register(BookCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension BooksCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortedBooks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCell
        
        let book = sortedBooks[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}