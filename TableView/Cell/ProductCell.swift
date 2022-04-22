//
//  ProductCell.swift
//  TableView
//
//  Created by Pushpendra  Kumar on 22/04/22.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(model : ProductModel?){
        self.lbName.text = model?.name
        self.lbDescription.text = model?.description
    }
}
