//
//  GamesTableViewCell.swift
//  Campeoes
//
//  Created by Daivid Vasconcelos Leal on 19/08/21.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivHome: UIImageView!
    @IBOutlet weak var lbHome: UILabel!
    
    @IBOutlet weak var ivAway: UIImageView!
    @IBOutlet weak var lbAway: UILabel!
    
    @IBOutlet weak var lbScore: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setGameValues(with game: Game) {
        ivHome.image = UIImage(named: game.home)
        lbHome.text = game.home
        
        ivAway.image = UIImage(named: game.away)
        lbAway.text = game.away
        
        lbScore.text = game.score
    }

}
