//
//  AddToOrderCell.swift
//  newApp1
//
//  Created by Анастасия on 07.11.2025.
//

import UIKit
import SnapKit

final class AddToOrderCell: UITableViewCell {
    
    static let reuseID = "AddToOrderCell"
    
    var addToCartProducts: [AddToCartProduct] = []
    
    private lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Добавить к заказу?"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Screen.width * 0.5, height: Screen.width * 0.25)
        
        var collection = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(AddToOrderCollectionCell.self, forCellWithReuseIdentifier: AddToOrderCollectionCell.reuseID)
        
        collection.contentInset = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config2(addToCartProducts: [AddToCartProduct]) {
        self.addToCartProducts = addToCartProducts
        collectionView.reloadData()
    }
}

extension AddToOrderCell {
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(containerView).inset(10)
        }
        collectionView.snp.makeConstraints { make in
            make.right.left.bottom.equalTo(containerView)
            make.top.equalTo(titleLabel.snp.bottom)
            make.height.equalTo(Screen.width * 0.3)
        }
    }
}

extension AddToOrderCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return addToCartProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddToOrderCollectionCell.reuseID, for: indexPath) as? AddToOrderCollectionCell else { return UICollectionViewCell() }
        
        let addToCartProducts = addToCartProducts[indexPath.row]
        
        cell.update2(addToCartProducts)
        return cell
    }
}
