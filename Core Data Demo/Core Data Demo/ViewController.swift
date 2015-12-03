//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Van Huy on 12/3/15.
//  Copyright (c) 2015 Example. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var context: NSManagedObjectContext = appDel.managedObjectContext!
        
//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as! NSManagedObject
//        
//        newUser.setValue("Jon", forKey: "username")
//        newUser.setValue("pass", forKey: "password")
//        
//        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if results?.count > 0 {
            for result: AnyObject in results! {
                println(result)
                println(result.valueForKey("username"))
            }
        } else {
            println("No results")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

