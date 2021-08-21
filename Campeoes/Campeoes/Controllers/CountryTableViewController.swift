//
//  CountryTableViewController.swift
//  Campeoes
//
//  Created by Daivid Vasconcelos Leal on 19/08/21.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    var worldCups: [WorldCup] = []
    var wineres: [WorldCup] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWorldCups()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wineres.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        let worldCup = wineres[indexPath.row]
        
        countryCell.textLabel?.text = "\(worldCup.winner)"
        countryCell.imageView?.image = UIImage(named: worldCup.winner)
    
        return countryCell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CountryDetailsViewController
        let winner = wineres[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = winner
        vc.worldCups = worldCups
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            wineres = checkDuplicatesAndRemove(worldCup: worldCups)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func checkDuplicatesAndRemove(worldCup: [WorldCup]) -> [WorldCup] {
        var aux = [WorldCup]()
        for worldCups in worldCups {
            if !aux.contains(where: {$0.winner ==  worldCups.winner}) {
                aux.append(worldCups)
            }
        }
        return aux
    }

}
