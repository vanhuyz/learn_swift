//
//  ViewController.swift
//  JSON Demo
//
//  Created by Van Huy on 12/3/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=Tokyo,jp&appid=2de143494c0b295cca9337e1e96b00e0"
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                println(error)
            } else {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                println(jsonResult["weather"])
            }
            
        })
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

