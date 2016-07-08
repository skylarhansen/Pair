//
//  PairListTableViewController.swift
//  Pair
//
//  Created by Skylar Hansen on 7/8/16.
//  Copyright © 2016 Skylar Hansen. All rights reserved.
//

import UIKit

class PairListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return EntityController.sharedController.fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath)

        

        return cell
    }
    
    // MARK: - Action Button
 
    @IBAction func addButtonTapped(sender: AnyObject) {
        let alertController = UIAlertController(title: "Add Person", message: "Add someone new to the list.", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Full Name"
        }
        let addAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let textField = alertController.textFields?.first,
                entityName = textField.text else { return }
            EntityController.sharedController.addEntity(entityName)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
