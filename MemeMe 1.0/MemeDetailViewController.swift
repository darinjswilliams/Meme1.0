//
//  MemeDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Darin Williams on 2/17/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: ViewController.Meme!

    @IBOutlet weak var imageDetailControll: UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageDetailControll = self.meme.memedImage
    }
    
    
    


}
