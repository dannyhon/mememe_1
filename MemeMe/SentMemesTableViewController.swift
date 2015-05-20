//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Wing Hon on 5/16/15.
//  Copyright (c) 2015 GE Healthcare. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var memes: [Meme]!
    var firstStarted: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        

        
        // Get the meme array from AppDelegate
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        memes = appDelegate.memes

        // If the app is first started and there are no memes, go to Meme Editor
        if firstStarted {
            firstStarted = false
            if memes.count == 0 {
                performSegueWithIdentifier("AddMeme", sender: self)
            }
        }
        
        // After popViewControllerAnimated is called from the
        // Meme Editor, the same table view is displayed without
        // the new memed image added.
        // Execute reload data to force a reload,
        // but only does so if there are new meme sent
        // to improve performance.
        // Reload is not needed if user has not shared any new meme.
        if tableView.numberOfRowsInSection(0) != memes.count {
            tableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell") as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the memed image and title
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText
        
        // If the cell has a detail label, we will provide
        // bottom text.
        if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = meme.bottomText
        }
        
        return cell
    }

    // When an image is selected, go to the detail controller
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }

}
