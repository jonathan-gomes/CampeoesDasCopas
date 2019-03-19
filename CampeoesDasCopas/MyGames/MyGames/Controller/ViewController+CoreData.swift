//
//  ViewController+CorData.swift
//  MyGames
//
//  Created by Jonathan Gomes on 11/03/2019.
//  Copyright © 2019 Jonathan Gomes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func saveContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
