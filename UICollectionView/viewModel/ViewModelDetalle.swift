//
//  ViewModelDetalle.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 9/9/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ViewModelDetalle{
    
    // we have to initialize the Dynamic var with the
    // data type we want
    weak var dataSource : GenericDataSource<Hero>?

    init(dataSource : GenericDataSource<Hero>?) {
        self.dataSource = dataSource
    }
    
    func fetchCurrencies() {
        //url
        let url = URL(string:"https://api.opendota.com/api/heroStats")
        //descarga de datos
        Alamofire.request(url!).responseJSON { (response) in
            
            switch response.result{
            case .success:
                do{
                    //self.heroes =  try JSONDecoder().decode([Hero].self, from: response.data!)
                    self.dataSource?.data.value = try JSONDecoder().decode([Hero].self, from: response.data!)
                    
                }catch let JSON_error{
                    print("error",JSON_error)
                }
            case.failure(let error):
                print(error)
            }
        }
    }
}
