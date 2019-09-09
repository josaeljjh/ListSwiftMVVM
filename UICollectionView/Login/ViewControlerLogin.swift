//
//  ViewControlerLogin.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 8/23/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import Foundation
import Nuke

class ViewControllerLogin: UIViewController {
    
    @IBOutlet weak var imgFondo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setBackgroud()
    }
    
    func setBackgroud(){
     view.addSubview(imgFondo)
        imgFondo.translatesAutoresizingMaskIntoConstraints = false
        imgFondo.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imgFondo.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imgFondo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgFondo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgFondo.image = UIImage(named: "KotlinAndroid-Wallpaper")
        //Nuke.loadImage(with: url!, into: cell.imgBandera)
        view.sendSubviewToBack(imgFondo)
        
    }
    
}
