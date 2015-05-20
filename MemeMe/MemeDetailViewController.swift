//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Wing Hon on 5/16/15.
//  Copyright (c) 2015 GE Healthcare. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    var meme: Meme!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.memeImageView.image = meme.memedImage
        // Hide tabBar menu
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Unhide tabBar menu
        self.tabBarController?.tabBar.hidden = false
    }

}
