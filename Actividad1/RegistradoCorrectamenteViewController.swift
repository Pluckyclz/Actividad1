//
//  RegistradoCorrectamenteViewController.swift
//  Actividad1
//
//  Created by usuario on 1/11/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit
import CoreData

class RegistradoCorrectamenteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        
        do {
            
            let fetchedUsers = try context.fetch(usersFetch) as! [Empleado]
            
            //print(type(of:fetchedUsers))
            for empleado in fetchedUsers{
                let reg = Registrado(nombre: empleado.nombre!)
                if reg?.nombre != nil {
                    print(reg?.nombre)
                }
            }
            
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        // Do any additional setup after loading the view.
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
