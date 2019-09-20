//
//  Document+CoreClass.swift
//  DocumentsCoreData
//
//  Created by Megan Wilson on 9/19/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    var modifiedDate: Date?{
        get{
            return rawModifiedDate as Date?
        }
        set{
            rawModifiedDate = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, context: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let manageContext = appDelegate?.persistentContainer.viewContext,
            let name = name, name != "" else {
            return nil
        }
        self.init(entity: Document.entity(), insertInto: manageContext)
        self.name = name
        
    }
}

