//
//  ViewController.swift
//  CoreDataNumber
//
//  Created by Hiếu Nguyễn on 9/22/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            textNumber.text = "\(entity?.last?.number ?? 0)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveNumber(_ sender: UIBarButtonItem) {
        if textNumber.text != "" {
            let context = Entity(context: AppDelegate.context)
            context.number = Int16(Int(textNumber.text ?? "") ?? 0)
            AppDelegate.saveContext()
        }
    }
    
}

