//
//  SroriesCell.swift
//  newApp1
//
//  Created by Анастасия on 20.12.2025.
//

import UIKit
import SnapKit

final class StoryCell: UITableViewCell {
    
    static let reuseID = "StoryCell"
    
    private var stories: [Story] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 125)
        layout.minimumLineSpacing = 4
        
        collectionView.register(StoryCollectionCell.self, forCellWithReuseIdentifier: StoryCollectionCell.reuseID)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(stories: [Story]) {
        self.stories = stories
        collectionView.reloadData()
    }
}

private extension StoryCell {
    func setupViews() {
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension StoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionCell.reuseID, for: indexPath) as? StoryCollectionCell else { return UICollectionViewCell() }
        
        let story = stories[indexPath.row]
        cell.update(story)
        
        return cell
    }
  
}
