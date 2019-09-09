//
//  ViewController.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 8/21/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import UIKit
import Nuke

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let item = ["AF","AL","DZ","AD","AO","AR","AM","AW","AU","AT","AZ","BH","BD","BY","BE","BZ","BJ","BT","BO","BA","BW","BR","BN","BG","BF","MM","BI","KH","CM","CA","CV","CF","TD","CL","CN","CX","CC","CO","KM","CG","CD","CK","CR","HR","CU","CY","CZ","DK","DJ","TL","EC","EG",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableItem", for: indexPath) as! TableViewCell
        
        let url = URL(string: "https://www.countryflags.io/\(item[indexPath.item])/flat/64.png")
        Nuke.loadImage(with: url!, into: tableCell.imgTable)
        tableCell.textTable.text = getCountryZipCode(item[indexPath.item])
        
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(item[indexPath.item])

        let nextViewController = UIStoryboard(name: "Main",bundle: nil).instantiateViewController(withIdentifier: "listaCollection") as! ViewControllerDetalle
        self.navigationController?.pushViewController(nextViewController, animated:true)
        
    }
    
    //obtener nombre del pais
    func getCountryZipCode(_ countryCode:String) -> String?{
        let name = (Locale(identifier: "es_SV") as NSLocale).displayName(forKey: .countryCode, value: countryCode)
        return name
    }
}

