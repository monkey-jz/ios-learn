//
//  ProductTableViewCell.swift
//  FirstProject
//
//  Created by boyaa on 2022/8/10.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
