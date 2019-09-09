//
//  GenericDataSource.swift
//  UICollectionView
//
//  Created by Josael Hernandez on 9/9/19.
//  Copyright © 2019 Josael Hernandez. All rights reserved.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
