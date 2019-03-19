//
//  GamesTableViewCell.swift
//  CampeoesDasCopas
//
//  Created by Jonathan Gomes on 07/03/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
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
    
    func prepare(with game: Game) {
        ivHome.image = UIImage(named: "\(game.home).png")
        lbHome.text = game.home
        ivAway.image = UIImage(named: "\(game.away).png")
        lbAway.text = game.away
        lbScore.text = game.score
    }

}
