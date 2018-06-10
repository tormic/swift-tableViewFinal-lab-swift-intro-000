//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    let planetCellIdentifier: String = "PlanetCell"
    var planets: [Planet] = []
    
    func generatePlanetInfo() {
        let earth = Planet(name: "Earth", numberOfMoons: 1,
                           fullOrbit: 365.26,
                           facts:["Earth is the only planet not named after a god.",
                                  "Earth has a powerful magnetic field.",
                                  "Earth was once believed to be the center of the universe."])
        let march = Planet(name: "March",
                           numberOfMoons: 2,
                           fullOrbit: 687.0,
                           facts: ["Mars and Earth have approximately the same landmass.",
                                   "Mars is home to the tallest mountain in the solar system.",
                                   "Pieces of Mars have fallen to Earth."])
        planets.append(earth)
        planets.append(march)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //1 section
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        let planet = planets[indexPath.row]
        let moonOrMoons: String = planet.numberOfMoons == 1 ? "Moon" : "Moons"
        
        cell.planetNameLabel.text = planet.name
        cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons) \(moonOrMoons)"
        cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit) days (full orbit)"
        cell.numberOfFactsLabel.text = "\(planet.facts.count) facts"
        
        return cell
        
    }
    
    /*
     This method should dequeue a reusable cell using the reuse identifier specified in the table view controller's planetCellIdentifier property, then initialize its labels and return the cell.
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowPlanetDetails" { return }
        //get destination view controller
        if let dest = segue.destination as? FactTableViewController,
            let indexPath = tableView.indexPathForSelectedRow as NSIndexPath? {
            dest.planet = planets[indexPath.row]
        }
        
    }

}












