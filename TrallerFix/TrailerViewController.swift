//
//  TrailerViewController.swift
//  TrallerFix
//
//  Created by Abner Lima on 15/04/23.
//

import UIKit

class TrailerViewController: UIViewController {
    
    var trailer: Trailer!

    @IBOutlet weak var ivTrailer: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
