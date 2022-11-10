//
//  SessoesTableViewCell.swift
//  LearningTask-6.3
//
//  Created by jeovane.barbosa on 10/11/22.
//

import UIKit

class SessoesTableViewCell: UITableViewCell {

    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var linguagemLabel: UILabel!
    
    
    func setup(_ session: Session){
        horarioLabel.text = DateFormatter.format(date: session.dateTime, to: .hoursPlusMinutes)
        linguagemLabel.text = session.type.rawValue
    }
    override func prepareForReuse() {
        horarioLabel.text = nil
        linguagemLabel.text = nil
    }
}
