//
//  TableViewCell.swift
//  BreakingTheCycle
//
//  Created by MIRCEA COSMIN-IONUT on 18/03/2018.
//  Copyright © 2018 Cosmin. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(image:String, amount:String, title:String) {
        imageCell.image = UIImage(named: image)
        self.amount.text = amount
        self.title.text = title
    }
    
    @IBAction func addButton(_ sender: Any) {
        let oldAmount = self.amount.text!
        let newAmount = Double(oldAmount)! + 10.0
        
        self.amount.text = String(newAmount)
       
    }
    
    @IBAction func minusButton(_ sender: Any) {
        let oldAmount = self.amount.text!
        let newAmount = Double(oldAmount)! - 10.0
        
        self.amount.text = String(newAmount)
        
    }
    
}
