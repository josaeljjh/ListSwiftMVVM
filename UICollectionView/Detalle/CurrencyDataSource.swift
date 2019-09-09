//
//  CurrencyDataSource.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 9/9/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class CurrencyDataSource : GenericDataSource<Hero>,UICollectionViewDataSource{
    
    var pipeline = ImagePipeline.shared
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        //link para img
        let prefijolink = "https://api.opendota.com"
        let url = URL(string:prefijolink + data.value[indexPath.row].img)
        //cargar img con lib nuke
        // Nuke.loadImage(with: urlimg!, into: cell.imgHero)
        cell.textHero.text = data.value[indexPath.row].localized_name.capitalized
        loadImage(url, cell.imgHero)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data.value[indexPath.row].localized_name.capitalized)
    }
    
    func loadImage(_ urlimg: URL?,_ image: UIImageView) {
        
        let screenWidth = UIScreen.main.bounds.size.width / 3
        let targetSize = CGSize(width: screenWidth, height: (screenWidth * 2 / 3))
        
        let request = ImageRequest(
            url: urlimg!,
            processors: [
                ImageProcessor.Resize(size: targetSize),
                ImageProcessor.Circle()
            ]
        )
        
        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.5))
        options.pipeline = pipeline
        
        Nuke.loadImage(with: request, options: options, into:image)
    }
}
