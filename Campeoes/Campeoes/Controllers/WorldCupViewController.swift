//
//  WorldCupViewController.swift
//  Campeoes
//
//  Created by Daivid Vasconcelos Leal on 19/08/21.
//

import UIKit

class WorldCupViewController: UIViewController {
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbVice: UILabel!
    
    @IBOutlet weak var lbWinner: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var worldCup:  WorldCup!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "WorldCup \(worldCup.year)"
        
        ivWinner.image = UIImage(named: worldCup.winner)
        lbWinner.text = worldCup.winner

        ivVice.image = UIImage(named: worldCup.vice)
        lbVice.text = worldCup.vice
        
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"

    }
    
}

extension WorldCupViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldCup.matches[section].games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        cell.setGameValues(with: game)
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
}
