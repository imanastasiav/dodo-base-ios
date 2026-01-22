//
//  DetailProductVC.swift
//  newApp1
//
//  Created by Анастасия on 04.10.2025.
//

import UIKit

final class DetailProductVC: UIViewController {
    
    private var components: [Component] = []
    private var componentService = ComponentService()
    
    private var orderButtonView = OrderButtonView()
    
    private lazy var tableView = {
        var tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseId)
        tableView.register(ProductParametrCell.self, forCellReuseIdentifier: ProductParametrCell.reuseID)
        tableView.register(SizeCell.self, forCellReuseIdentifier: SizeCell.reuseID)
        tableView.register(DoughCell.self, forCellReuseIdentifier: DoughCell.reuseID)
        tableView.register(ComponentsCell.self, forCellReuseIdentifier: ComponentsCell.reuseID)
        
        tableView.separatorColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        fetchComponents()
    }
    
    private func fetchComponents() {
        self.components = componentService.fetchComponents()
        tableView.reloadData()
    }
}

private extension DetailProductVC {
    
    func setupViews () {
        view.addSubview(tableView)
        view.addSubview(orderButtonView)
    }
    
    func setupConstraints () {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        orderButtonView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview().inset(10)
        }
    }
}

extension DetailProductVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseId, for: indexPath) as? ImageCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductParametrCell.reuseID, for: indexPath) as? ProductParametrCell else { return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SizeCell.reuseID, for: indexPath) as? SizeCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DoughCell.reuseID, for: indexPath) as? DoughCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ComponentsCell.reuseID, for: indexPath) as? ComponentsCell else { return UITableViewCell() }
            cell.update(components: components)
            return cell
    
        default: return UITableViewCell()
        }
    }
}
