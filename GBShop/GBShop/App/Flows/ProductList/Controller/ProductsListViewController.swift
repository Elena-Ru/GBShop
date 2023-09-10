//
//  ProductsListViewController.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    //MARK: Variables
    private var rootView = ProductsListRootView()
    let goods = RequestFactory().makeGoodsRequestFactory()
    var products:[CatalogDataResult] = []
    
    override func loadView() {
        super.loadView()
        view = rootView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.collectionView.dataSource = self
        rootView.collectionView.delegate = self
        goods.getCatalogData(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let catalog):
                DispatchQueue.main.async {
                    self.products = catalog
                    self.rootView.collectionView.reloadData()
                }
            case.failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: Extensions
extension ProductsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.productName.text = products[indexPath.item].name
        cell.productId.text = "Id: \(String(products[indexPath.item].id))"
        cell.productPrice.text = "$\(String(products[indexPath.item].price))"
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newController = ProductDetailViewController()
        newController.modalPresentationStyle = .currentContext
        newController.index = products[indexPath.item].id
        self.navigationController?.pushViewController(newController, animated: true)
    }
    
}
