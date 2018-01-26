//
//  ImageViewController.swift
//  Meme Me 2.0
//
//  Created by KJ Schmidt on 1/25/18.
//  Copyright © 2018 KJ Schmidt. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageVC: UIImageView!
    var meme: Meme!
    
    override func viewWillAppear(_ animated: Bool) {
        imageVC.image = meme.memedImage
    }
}

