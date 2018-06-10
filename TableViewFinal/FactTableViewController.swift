//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UITableViewController {
    
    let factCellIdentifier: String = "FactCell"
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = planet.name //="factTableViewController.navigationItem.title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as! FactTableViewCell
        let fact = planet.facts[indexPath.row]
        cell.factTextView.text = fact
        
        return cell
    }
    
}
