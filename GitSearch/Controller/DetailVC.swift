//
//  DetailVC.swift
//  GitSearch
//
//  Created by Domagoj Biškup on 10/06/2021.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var repoNameL: UILabel!
    @IBOutlet weak var updatedAtL: UILabel!
    @IBOutlet weak var ownerNameL: UILabel!
    @IBOutlet weak var descriptionL: UILabel!
    
    let format = Format()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoNameL.text = gitRepo?.items[arrayIndex!].name
        self.updatedAtL.text = format.date((gitRepo?.items[arrayIndex!].updatedAt)!)
        self.ownerNameL.text = gitRepo?.items[arrayIndex!].owner.login
        self.descriptionL.text = gitRepo?.items[arrayIndex!].itemDescription
    }
}



