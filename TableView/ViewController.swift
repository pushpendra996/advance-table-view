//
//  ViewController.swift
//  TableView
//
//  Created by Pushpendra  Kumar on 22/04/22.
//

import UIKit

enum ViewControllerCellType : Int, CaseIterable {
  case search = 2, banner = 1, program = 0 ,product = 3
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var productList : [ProductModel] = [ProductModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setProducst()
        self.setTableView()
    }


    private func setTableView(){
        self.tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        self.tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: "BannerCell")
        self.tableView.register(UINib(nibName: "ProgramCell", bundle: nil), forCellReuseIdentifier: "ProgramCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
    private func setProducst(){
        for i in 0...100 {
            let model = ProductModel()
            model.id = "\(i)"
            model.name = "Product Name \(i + 1)"
            model.description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            self.productList.append(model)
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ViewControllerCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case ViewControllerCellType.search.rawValue :
            return 1
        case ViewControllerCellType.banner.rawValue :
            return 1
        case ViewControllerCellType.product.rawValue :
            return self.productList.count
        case ViewControllerCellType.program.rawValue :
            return 1
        default:
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case ViewControllerCellType.search.rawValue :
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
            cell.searchBar.delegate = self
            cell.selectionStyle = .none
            return cell
        case ViewControllerCellType.banner.rawValue :
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.selectionStyle = .none
            return cell
        case ViewControllerCellType.product.rawValue :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
            cell.selectionStyle = .none
            cell.setData(model : self.productList[indexPath.row])
            return cell
            
        case ViewControllerCellType.program.rawValue :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell", for: indexPath) as! ProgramCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Text : \(searchText)")
    }
}
