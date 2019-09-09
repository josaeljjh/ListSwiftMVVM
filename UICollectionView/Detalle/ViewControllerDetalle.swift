//
//  ViewControlerDetalle.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 8/30/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import Foundation
import UIKit
import Nuke
import Alamofire

class ViewControllerDetalle: UIViewController {
    //insancia de clase
    @IBOutlet weak var collectionGrid: UICollectionView!
    var pipeline = ImagePipeline.shared
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    let dataSource = CurrencyDataSource()
    
    lazy var viewModel : ViewModelDetalle = {
        let viewModel = ViewModelDetalle(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionGrid!.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
        self.collectionGrid.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.collectionGrid.reloadData()
        }
        
        self.viewModel.fetchCurrencies()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

