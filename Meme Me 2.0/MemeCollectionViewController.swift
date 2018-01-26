//
//  MemeCollectionViewController.swift
//  Meme Me 2.0
//
//  Created by KJ Schmidt on 1/25/18.
//  Copyright © 2018 KJ Schmidt. All rights reserved.
//

import UIKit

let reuseIdentifier = "MemeCollectionViewCell"

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout : UICollectionViewFlowLayout!
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = editButtonItem
        let space: CGFloat
        let dimension: CGFloat
        
        if (UIDeviceOrientationIsPortrait(UIDevice.current.orientation)) {
            space = 3.0
            dimension = (view.frame.size.width - (2 * space)) / 3 //3 per line
        } else {
            space = 5.0
            dimension = (view.frame.size.width - (2 * space)) / 5
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView!.reloadData()
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        
        // Configure the cell
        let meme = memes[indexPath.item]
        
        cell.backgroundView = UIImageView(image: meme.memedImage)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Grab the DetailVC from Storyboard
        let imageVC = storyboard!.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        imageVC.meme = memes[indexPath.row]
        navigationController!.pushViewController(imageVC, animated: true)
        
    }
    
    @IBAction func addMeme(_ sender: Any) {
        performSegue(withIdentifier: "addMemeFromCollection", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMemeFromCollection") {
            let editorVC = self.storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
            self.navigationController!.pushViewController(editorVC, animated: true)
        }
    }
}
