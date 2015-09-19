//
//  SecondViewController.swift
//  To Do List
//
//  Created by Richard Guerci on 19/09/2015.
//  Copyright © 2015 Richard Guerci. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var taskTextField: UITextField!
	
	
	@IBAction func addTaskButton(sender: AnyObject) {
		if taskTextField.text != "" {
			toDoList.append(taskTextField.text!)
			taskTextField.text = ""
			
			//Store to permanent storage
			NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		taskTextField.delegate = self
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//Remove keyboard when touch ouside the keyboard
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	//Remove keyboard when clic 'return'
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		taskTextField.resignFirstResponder()
		return true
	}
}

