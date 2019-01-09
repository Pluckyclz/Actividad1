//
//  ViewController.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 grupo salinas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usuarioText: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let rvc = segue.destination as? RegistroViewController{
            rvc.nombre = usuarioText
        }
    }*/

    @IBAction func llamarWSLogin(_ sender: Any) {
        if let url = URL(string: "\(Constantes.URL_DESA.apiWSLogin)?username=\(usuarioText.text!)&password=\(contrasena.text!.toBase64())") {
            print(url)
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request){
                (data,resp,error) in
                if error != nil{
                    print("Se produjo un error...")
                }else{
                    if let info = data {
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: info) as! [String:AnyObject]
                            print(jsonResult)
                            if let status = jsonResult["status"]{
                                if status as! Int == 1 {
                                    DispatchQueue.main.async {
                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                        let controller = storyboard.instantiateViewController(withIdentifier: "PVC")
                                        self.present(controller,animated: true, completion: nil)
                                    }
                                    
                                }else{
                                    print("No permitido")
                                }
                            }
                        }catch{
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}

