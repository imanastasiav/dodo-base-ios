//
//  ComponentsCell.swift
//  newApp1
//
//  Created by Анастасия on 19.10.2025.
//

import UIKit
import SnapKit

final class ComponentsCell: UITableViewCell {
    
    static let reuseID = "ComponentsCell"
    
    private var components: [Component] = []
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Добавить по вкусу"
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        
        let itemsCount: CGFloat = 3
        let padding: CGFloat = 18
        let paddingCount: CGFloat = itemsCount + 1
        
  
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding //горизонтальный спэйсинг
        layout.minimumInteritemSpacing = padding //вертикальный спейсинг
      
        let paddingSize = paddingCount * padding
        let cellSize = (UIScreen.main.bounds.width - paddingSize) / itemsCount
   
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        layout.itemSize = CGSize(width: cellSize, height: cellSize + 50) //размер ячейка
        
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ComponentsCollectionCell.self, forCellWithReuseIdentifier: ComponentsCollectionCell.reuseID)
        collection.isScrollEnabled = false
       // collection.contentInset = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        
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
    
    func update(components: [Component]) {
        self.components = components
        collectionView.reloadData()
    }
}
    
private extension ComponentsCell {
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(16)
            make.right.left.equalTo(contentView).inset(8)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(1200)
            make.right.left.bottom.equalTo(contentView)
        }
    }
}

extension ComponentsCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return components.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComponentsCollectionCell.reuseID, for: indexPath) as? ComponentsCollectionCell else { return UICollectionViewCell() }
        
        let component = components[indexPath.row]
        
        cell.update(component)
        return cell
    }
}
