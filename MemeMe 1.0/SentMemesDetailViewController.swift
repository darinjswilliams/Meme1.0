//
//  SentMemesDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Darin Williams on 2/23/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit
import Foundation

class SentMemesDetailViewController: UIViewController {
        

    @IBOutlet weak var viewDetailImage: UIImageView!
    var memesData: Meme!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         viewDetailImage?.image = memesData.memedImage
    }
    

}
