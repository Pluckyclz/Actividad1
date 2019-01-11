//
//  RegistradosTableViewController.swift
//  Actividad1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit
import CoreData

class RegistradosTableViewController: UITableViewController {

    var registrados = [Registrado]()
    var arraytest = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cargarEmpleados()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func cargarEmpleados(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Empleado")
        
        do {
           
            let fetchedUsers = try context.fetch(usersFetch) as! [Empleado]
            
            //print(type(of:fetchedUsers))
            for empleado in fetchedUsers{
                let reg = Registrado(nombre: empleado.nombre!)
                if reg?.nombre != nil {
                    registrados+=[reg!]
                }
            }
            
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrados.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // LLenar celdas
        
        let cellIdentifier = "EmpleadoTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EmpleadoTableViewCell  else {
            fatalError("No se logro instancia de EmpleadoTableViewCell.")
            
        }
        let reg = registrados[indexPath.row]
        cell.nombre!.text = reg.nombre
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
