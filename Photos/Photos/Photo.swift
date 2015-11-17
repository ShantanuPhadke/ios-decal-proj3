//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    
    /* The url for the thumbnail of the image */
    var thumbnail_url : String!
    
    /* The username of the photographer. */
    var username : String!
    /* The date when the photographer posted the file. */
    var date : String!
    
    var liked: Bool! = false
    
    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        username = (data.valueForKey("user") as! NSDictionary!).valueForKey("username") as! String!
        
        url = (((data.valueForKey("images")) as! NSDictionary!).valueForKey("standard_resolution") as! NSDictionary!).valueForKey("url") as! String!
        
        thumbnail_url = (((data.valueForKey("images")) as! NSDictionary!).valueForKey("thumbnail") as! NSDictionary!).valueForKey("url") as! String!
        
        likes = ((data.valueForKey("likes")) as! NSDictionary!).valueForKey("count") as! Int!
        
        date = data.valueForKey("created_time") as! String!
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
    }
    
}