//
//  RutasViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit
import CoreData

class RutasViewController: UIViewController {

    @IBOutlet weak var ruta1Button: UIButton!
    @IBOutlet weak var ruta2Button: UIButton!
    @IBOutlet weak var ruta3Button: UIButton!
    @IBOutlet weak var tablaEmpleado: UITableView!
    
    @IBAction func verRuta(_ sender: UIButton) {
        print(sender.currentTitle)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let empleado = Empleado(context: context)
        
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        
        do {
            let fetchedUsers = try context.fetch(usersFetch) as! [Empleado]
            
            //print(type(of:fetchedUsers))
            for empleado in fetchedUsers{
        
            }
            
            
        } catch {
            fatalError("Failed to fetch users: \(error)")
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func mainButton(sender: UIButton) {
        print(sender.tag)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
