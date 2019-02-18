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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //deque the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
    
        // Get the row for meme object
         let memeCollection = self.memes[(indexPath as NSIndexPath).row]
        
        //Set Labels and Image
        cell.topLabelCustomMeme.text = memeCollection.topText
        cell.bottomLabelCustomMeme.text = memeCollection.bottomText
        cell.imageCustomMeme?.image =  memeCollection.originalImage
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Get instance  of conroller from StoryBoard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
       
        
        //Populae ViewController with selected item
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
       
        
        //Push the view Controller using navigation
        navigationController!.pushViewController(detailController, animated: true)
    }


}
