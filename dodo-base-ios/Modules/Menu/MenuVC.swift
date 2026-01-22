//
//  ViewController.swift
//  newApp1
//
//  Created by Анастасия on 24.09.2025.
//

import UIKit
import SnapKit

enum MenuSection: Int, CaseIterable {
    case stories = 0
    case banners = 1
    case categories = 2
    case mainProduct = 3
    case products = 4
}

final class MenuVC: UIViewController {
    
    private let addressHeaderView = AddressHeaderView()
    
    private var storiesLoader = StoriesLoader()
    private var bannersLoader = BannersLoader()
    private var categoriesLoader = CategoriesLoader()
    private var mainProductLoader = ProductsLoader()
    private var productsLoader = ProductsLoader()

    var stories: [Story] = []
    var banners: [Product] = []
    var products: [Product] = []
    var mainProduct: [Product] = []
    var categories: [Category] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(StoryCell.self, forCellReuseIdentifier: StoryCell.reuseID)
        tableView.register(BannerCell.self, forCellReuseIdentifier: BannerCell.reuseID)
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseID)
        tableView.register(MainProductCell.self, forCellReuseIdentifier: MainProductCell.reuseID)
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)

        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        fetchStories()
        fetchBanners()
        fetchCategories()
        fetchMainProduct()
        fetchProducts()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 520
    }
    
    func fetchStories() {
        storiesLoader.loadStories { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let stories):
                self.stories = stories
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchBanners() {
        bannersLoader.loadBanners { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let banners):
                self.banners = banners
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCategories() {
        categoriesLoader.loadCategories { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let categories):
                self.categories = categories
                
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchMainProduct() {
        mainProductLoader.loadProducts { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let products):
                self.mainProduct = products
                
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchProducts() {
        productsLoader.loadProducts { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let products):
                self.products = products
                
                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func openAddressPicker() {
        let vc = AddressPickerVC()
        vc.onPickAddress = { [weak self] address in
            self?.addressHeaderView.setAddress(address)
            // тут же можешь сохранить в UserDefaults/Storage
        }

        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let header = tableView.tableHeaderView else { return }
        let targetHeight: CGFloat = 76
        if header.frame.width != view.bounds.width || header.frame.height != targetHeight {
            header.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: targetHeight)
            tableView.tableHeaderView = header
        }
    }
}

private extension MenuVC {
    
    func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .white

        addressHeaderView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 76)
        tableView.tableHeaderView = addressHeaderView

        addressHeaderView.onTapAddress = { [weak self] in
            self?.openAddressPicker()
        }
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//что таблица будет отображать (данные)
extension MenuVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count //3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //productCellType.count
        
        if let sectionType = MenuSection(rawValue: section) {
            
            switch sectionType {
            case .stories:
                return 1
            case .banners:
                return 1
            case .categories:
                return 1
            case .mainProduct:
                return 1
            case .products:
                return products.count
            }
        }
    return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let sectionType = MenuSection(rawValue: indexPath.section) {
            
            switch sectionType {
            case .stories:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryCell.reuseID, for: indexPath) as? StoryCell else { return UITableViewCell() }
                cell.config(stories: stories)
                return cell
            case .banners:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerCell.reuseID, for: indexPath) as? BannerCell else { return UITableViewCell() }
                cell.config(products: banners)
                return cell
                
            case .categories:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseID, for: indexPath) as? CategoryCell else {
                    return UITableViewCell() }
                cell.config(categories: categories)
                cell.onCategoryTap = { [weak self] category in
                    let сategoryProductsVC = CategoryProductVC()
                    self?.present(сategoryProductsVC, animated: true)
                }
                return cell
            
            case .mainProduct:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: MainProductCell.reuseID, for: indexPath) as? MainProductCell else { return UITableViewCell() }
                guard let mainProduct = mainProduct[safe: indexPath.row] else { return UITableViewCell() }
                cell.update(mainProduct)
                cell.onButtonTap = {
                let detailProductVC = DetailProductVC()
                self.present(detailProductVC, animated: true)
                }
                return cell
                
            case .products:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else { return UITableViewCell() }
                
                let product = products[indexPath.row]
                cell.update(product)
                
                cell.onButtonTap = {
                    let detailProductVC = DetailProductVC()
                    self.present(detailProductVC, animated: true)
                }
                return cell
            }
        }
        return UITableViewCell()
    }
}
        
extension MenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let sectionType = MenuSection(rawValue: indexPath.section) {
            
            switch sectionType {
            case .products:
                let detailProductVC = DetailProductVC()
                self.present(detailProductVC, animated: true)
            default:
                break
            }
        }
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
