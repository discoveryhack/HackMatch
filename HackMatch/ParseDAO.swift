//
//  ParseDAO.swift
//  HackMatch
//
//  Created by Ankit Jasuja on 9/11/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class ParseDAO: NSObject {

    var className : String!
    
    init(className : String) {
        self.className = className
    }

    // =============== Write ====================
    
    func upsert(pfObject :  PFObject, completion : (Bool, PFObject?, NSError?) -> Void) {
        pfObject.saveInBackgroundWithBlock { (created: Bool, error: NSError?) -> Void in
            completion(created, pfObject, error)
        }
    }
    
    func deleteById(id : String, completion : (Bool, NSError?) -> ()) {
        getById(id) { (pfObject : PFObject?, error : NSError?) in
            if let pfObject = pfObject {
                pfObject.deleteInBackgroundWithBlock({ (deleted : Bool, error :NSError?) in
                    completion(deleted, error)
                })
            }
        }
    }
    
    func deleteAll(completion: (NSError?) -> ()) {
        let pfQuery = PFQuery(className: className)
        pfQuery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            for object in objects! {
                object.deleteInBackground()
            }
            completion(error)
        }
    }
    
    // =============== Read ====================
    
    func getAll(completion : ([PFObject]?, NSError?) -> Void) {
        let pfQuery = PFQuery(className: className)
//        pfQuery.includeKey("password")
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            print("")
            completion(objects, error)
        }
    }
    
    func getAllWithIncludeKeys(parseContext : ParseContext, completion : ([PFObject]?, NSError?) -> Void) {
        let pfQuery = PFQuery(className: parseContext.className)
        
        if parseContext.includeKeyParams.count != 0 {
            pfQuery.includeKeys(parseContext.includeKeyParams)
        }
        
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            completion(objects, error)
        }
    }
    
//    func getAllByForeignKey(completion : ([PFObject]?, NSError?) -> Void) {
//        let pfQueryInner = PFQuery(className: Constants.TODO_CATEGORY_CLASSNAME)
//        pfQueryInner.whereKey("objectId", equalTo: "b6RZfzOYc")
//        
//        let pfQuery = PFQuery(className: className)
//        pfQuery.whereKey("category", matchesQuery: pfQueryInner)
//        
//        pfQuery.findObjectsInBackgroundWithBlock {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            completion(objects, error)
//        }
//    }
    
    func getAllByForeignKey(parseContext : ParseContext, completion : ([PFObject]?, NSError?) -> Void) {
        let innerPredicate = NSPredicate(format: parseContext.innerPredicateFormat!)
        let pfQueryInner = PFQuery(className: parseContext.innerClassName!, predicate: innerPredicate)
        if (parseContext.innerIncludeKeyParams.count != 0) {
            pfQueryInner.includeKeys(parseContext.innerIncludeKeyParams)
        }
        
        let predicate = NSPredicate(format: parseContext.predicateFormat!, pfQueryInner)
        let pfQuery = PFQuery(className: parseContext.className, predicate: predicate)
        
        if parseContext.includeKeyParams.count != 0 {
            pfQuery.includeKeys(parseContext.includeKeyParams)
        }
        
        pfQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            completion(objects, error)
        }
    }
    
    func getById(id: String, completion : (PFObject?, NSError?) -> ()) {
        let pfQuery = PFQuery(className: className)
        pfQuery.getObjectInBackgroundWithId(id) { (pfObject : PFObject?, error : NSError?) in
            completion(pfObject, error)
        }
    }
    
}
