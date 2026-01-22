//
//  FirstProductCell.swift
//  newApp1
//
//  Created by Анастасия on 07.10.2025.
//

import UIKit
import SnapKit

struct Screen {
    static let bounds = UIScreen.main.bounds
    static let width = UIScreen.main.bounds.width
}

final class BannerCell: UITableViewCell {
    
    static let reuseID = "FirstProductCell"
    
    private var products: [Product] = []
    
    //делаем, чтобы задать высоту ячейки, тени
    private lazy var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .orange.withAlphaComponent(0.2)
        view.heightAnchor.constraint(equalToConstant: 160).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Выгодно и вкусно"
        label.font = .boldSystemFont(ofSize: 20)
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
        collection.register(BannerCollectionCell.self, forCellWithReuseIdentifier: BannerCollectionCell.reuseID)
        
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
    
    func config(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}

private extension BannerCell {
    
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
            make.top.left.right.equalTo(containerView).inset(16)
        }
        collectionView.snp.makeConstraints { make in
            make.right.left.bottom.equalTo(containerView)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
    }
}

extension BannerCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionCell.reuseID, for: indexPath) as? BannerCollectionCell else { return UICollectionViewCell() }
        
        let product = products[indexPath.row]
        
        cell.update(product)
        return cell
    }
}

