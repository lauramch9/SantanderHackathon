//
//  PlanSavingsTableViewController.swift
//  BreakingTheCycle
//
//  Created by MIRCEA COSMIN-IONUT on 18/03/2018.
//  Copyright © 2018 Cosmin. All rights reserved.
//

import UIKit

class PlanSavingsTableViewController: UIViewController {

    let categories = ["Entertainment","Food","Gifts"]
    let values = ["160","100","60"]
    
    var target: String = ""
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var availableBudget: UILabel!
    
    @IBOutlet weak var targetSavings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.delegate = self
        myTable.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if target == "" {
            targetSavings.text = "500"
        } else {
            targetSavings.text = target
        }
        
        
       
    }
    
    @IBAction func saveActions(_ sender: Any) {
        
    }
    
    
    
}

extension PlanSavingsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        cell.setup(image: categories[indexPath.row], amount: values[indexPath.row], title: categories[indexPath.row])
        //cell.textLabel?.text = categories[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    

}
