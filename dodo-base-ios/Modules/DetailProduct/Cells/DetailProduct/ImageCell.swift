//
//  ImageCell.swift
//  newApp1
//
//  Created by Анастасия on 18.10.2025.
//

import UIKit
import SnapKit

final class ImageCell: UITableViewCell {
    
    static let reuseId = "ImageCell"
    
    private var imageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hawaii")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { //точка входа
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ImageCell {
    func setupViews() {
        contentView.addSubview(imageImageView)
    }
    
    func setupConstraints() {
        imageImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(350)
        }
    }
}

