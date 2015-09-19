//
//  FirstViewController.swift
//  To Do List
//
//  Created by Richard Guerci on 19/09/2015.
//  Copyright © 2015 Richard Guerci. All rights reserved.
//

import UIKit

//To Do list data
var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

	@IBOutlet weak var toDoListTable: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Get table from permanent storage
		if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
			toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//Return number of task in the list
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return toDoList.count
	}
	
	//Fill content of each cell
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		//Create cell with idebtifier (refering to the prototype cell)
		let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
		cell.textLabel?.text = toDoList[indexPath.row]
		
		return cell
	}
	
	//Enable cell removing
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		
		if editingStyle == UITableViewCellEditingStyle.Delete {
			//Remove element selected
			toDoList.removeAtIndex(indexPath.row)
			
			//Store table to permanent storage
			NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
			
			//Refresh table
			toDoListTable.reloadData()
		}
		
		
		
	}
	
	override func viewDidAppear(animated: Bool) {
		//Refresh table
		toDoListTable.reloadData()
	}
}

