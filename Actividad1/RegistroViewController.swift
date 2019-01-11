//
//  RegistroViewController.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit
import CoreData

class RegistroViewController: UIViewController {
    
    @IBOutlet weak var nombreText: UITextField!
    @IBOutlet weak var contrasenia: UITextField!
    @IBOutlet weak var repetirContrasenia: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var fecha_nacimiento: UITextField!
    @IBOutlet weak var numero_empleado: UITextField!
    @IBOutlet weak var telefono: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registrarse(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let empleado = Empleado(context: context)
        empleado.nombre = nombreText.text
        empleado.pass = contrasenia.text
        empleado.email = email.text
        empleado.fecha_nacimiento = fecha_nacimiento.text
        empleado.numero_empleado = 1
        empleado.telefono = telefono.text
        appDelegate.saveContext()
        
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
