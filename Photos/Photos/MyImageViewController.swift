//
//  MyImageViewController.swift
//  Photos
//
//  Created by Shantanu Phadke on 11/16/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class MyImageViewController: UIViewController{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var date_posted: UILabel!
    @IBOutlet var number_of_likes: UILabel!
    //@IBOutlet var like_button: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    var photo: Photo!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        makeView()
        if !photo.liked{
            likeButton.setTitle("💙",forState: UIControlState.Normal)
        }else{
            likeButton.setTitle("❤️", forState: UIControlState.Normal)
        }
        
        
    }
    
    func makeView(){
       self.date_posted.text = photo.date
       self.number_of_likes.text = String(photo.likes)
       self.username.text = photo.username
        
        
        let myUrl = NSURL(string: photo.url)
        let mySession = NSURLSession.sharedSession()
        let task = mySession.dataTaskWithURL(myUrl!,completionHandler: {
            (data, response, error) -> Void in
            if error == nil {
                let img = UIImage(data: data!)
                self.imageView.image = img
            }
            
            
        })
       task.resume()

    }
    
    @IBAction func likePressed(sender:AnyObject){
        if likeButton.currentTitle == "💙" {
            likeButton.setTitle("❤️", forState: UIControlState.Normal)
            photo.likes = photo.likes + 1
            photo.liked = true
            number_of_likes.text = "\(self.photo.likes)"
        }     }
    
    
}
