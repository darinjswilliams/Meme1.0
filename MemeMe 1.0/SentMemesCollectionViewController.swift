//
//  SentMemesCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Darin Williams on 2/16/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CustomMemeCell"

class SentMemesCollectionViewController: UICollectionViewController {
    
    var memes: [ViewController.Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    @IBOutlet weak var addMemesButton: UIBarButtonItem!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Refresh the data
        collectionView!.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        let space:CGFloat = 1.0
        let dimension = (self.view.frame.size.width - (2 * space)) / 3.0
        let heightDimension =  (self.view.frame.size.height - (1 * space)) / 8.0
    
        //height be set up the same way as width
        //Set spacing between items with minimuInteritemSpacing
        flowLayout.minimumInteritemSpacing = space
        
        //Set spacing between rows
        flowLayout.minimumLineSpacing = space
        
        //Set size of cells
        flowLayout.itemSize = CGSize(width: dimension, height: heightDimension)
    }


    @IBAction func editMemes(_ sender: Any) {
      performSegue(withIdentifier: "CreateMemes", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.memes.count
    }

        //MARK: cellForItemAt return a custom cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //dequeue an instance of  the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
    
        // Get the row for meme object
         let memeCollection = self.memes[(indexPath as NSIndexPath).row]
        
        //Set Labels and Image
        cell.topLabelCustomMeme.text = memeCollection.topText
        cell.bottomLabelCustomMeme.text = memeCollection.bottomText
        cell.imageCustomMeme?.image =  memeCollection.originalImage
    
        return cell
    }

        //MARK present a detail view of selected MEME
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Get instance  of the  DetailViewControll from StoryBoard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: reuseIdentifier) as! MemeDetailViewController
       
        
        //Populae ViewController with selected item
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
       
        
        //Push the view Controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
    }


}
