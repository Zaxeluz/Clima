//
//  ViewController.swift
//  Clima
//
//  Created by Alumno on 18/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var lblGrados: UILabel!
    @IBOutlet weak var lblPrecioMexicano: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    @IBAction func doTapActualizarClima(_ sender: Any) {
        lblGrados.text = ""
        lblPrecioMexicano.text = ""
        aiCargarClima.startAnimating()
        Alamofire.request(urlClima).responseJSON {
            response in
            if let dictRespuesta = response.result.value as?
                NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double{
                        self.lblGrados.text = "\(temp)º"
                        self.aiCargarClima.stopAnimating()
                    }
                }
                
            } else {
                //AVISARLE AL USUARIO QUE NO SE PUDO LEER LA RESPUESTA
            }
            
        }
        
        Alamofire.request(urlPesoMexicano).responseJSON {
            response in
            if let dictRespuesta = response.result.value as?
                NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary {
                    if let val = dictMain.value(forKey: "val") as? Double{
                        self.lblPrecioMexicano.text = "\(val)"
                        self.aiCargarClima.stopAnimating()
                    }
                }
                
            } else {
                //AVISARLE AL USUARIO QUE NO SE PUDO LEER LA RESPUESTA
            }
            
        }
        
    }
    let urlPesoMexicano = "https://free.currencyconverterapi.com/api/v6/convert?q=USD_MXN&compact=y"
    let urlClima = "https://api.openweathermap.org/data/2.5/weather?q=Ciudad+Obregon&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        aiCargarClima.startAnimating()
        
        Alamofire.request(urlClima).responseJSON {
            response in
            if let dictRespuesta = response.result.value as?
                NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    if let temp = dictMain.value(forKey: "temp") as? Double{
                        self.lblGrados.text = "\(temp)º"
                        self.aiCargarClima.stopAnimating()
                    }
                }
                
            } else {
                //AVISARLE AL USUARIO QUE NO SE PUDO LEER LA RESPUESTA
            }
                
        }
        
        Alamofire.request(urlPesoMexicano).responseJSON {
            response in
            if let dictRespuesta = response.result.value as?
                NSDictionary{
                
                if let dictMain = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary {
                    if let val = dictMain.value(forKey: "val") as? Double{
                        self.lblPrecioMexicano.text = "\(val)"
                        self.aiCargarClima.stopAnimating()
                    }
                }
                
            } else {
                //AVISARLE AL USUARIO QUE NO SE PUDO LEER LA RESPUESTA
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

