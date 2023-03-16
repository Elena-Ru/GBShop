//
//  ProductDetailViewController.swift
//  GBShop
//
//  Created by Елена Русских on 16.03.2023.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    //MARK: Variables
    private var rootView = ProductDetailRootView()
    let goods = RequestFactory().makeGoodsRequestFactory()
    let reviewFactory = RequestFactory().makeReviewsRequestFactory()
    var index : Int?
    var product : ProductByIdResult?
    var reviews = [Review]()
    
    //MARK: Private methods
    private func getProduct(id: Int) {
        goods.getGoodById(id: id) { response in
            switch response.result {
            case .success(let product):
                DispatchQueue.main.async {
                    self.product = product
                    self.rootView.configure(name: product.name, price: product.price, description: product.description)
                }
            case.failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    private func getReviews(id: Int) {
        reviewFactory.getListReview(page: 1, idProduct: id) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.reviews = result.reviews
                    print(self.reviews[0].idComment)
                    self.rootView.tableView.reloadData()
                }
            case.failure(let error):
                print(String(describing: error))
                print(error.localizedDescription)
            }
        }
    }
    
    
    override func loadView() {
        super.loadView()
        
        guard let index = index else {return}
        getProduct(id: index)
        getReviews(id: index)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rootView.tableView.reloadData()
    }
    
}

//MARK: Extensions
extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else { return UITableViewCell()}
        cell.idLabel.text = "id: \(reviews[indexPath.row].idComment)"
        cell.reviewLabel.text = "\(reviews[indexPath.row].text)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect.init(x: headerView.frame.width / 2 - 20, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.text = "Reviews"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor.brandDarkPurple
        headerView.addSubview(label)
        headerView.backgroundColor = .white
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
}

