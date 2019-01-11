//
//  EmpleadoTableViewCell.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit

class EmpleadoTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
