//
//  StoryCollectionCell.swift
//  newApp1
//
//  Created by Анастасия on 20.12.2025.
//

import UIKit
import SnapKit

final class StoryCollectionCell: UICollectionViewCell {
    
    static let reuseID = "StoryCollectionCell"
    
    var containerView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var photoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage.init(named: "story1")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ stories: Story) {
        photoImageView.image = UIImage(named: stories.imageName)
    }
}

private extension StoryCollectionCell {
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(photoImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(2)
        }
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
