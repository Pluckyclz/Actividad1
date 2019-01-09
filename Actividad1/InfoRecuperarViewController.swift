//
//  InfoRecuperarViewController.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit

class InfoRecuperarViewController: UIViewController {

    var correo:String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isEqual = (correo == "test@mail.com")
        
        if isEqual{
            print("Ingreso : " + correo)
            /*
            let alert = UIAlertController(title: "Reenvio de contraseña?", message: "Se enviará un correo a \(correo) con las instrucciones para recuperar tu contraseña.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Si", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)*/
        } else {
            print("No se encontró correo registrado")
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
