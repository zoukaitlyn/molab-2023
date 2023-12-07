//
//  Collection.swift
//  ColorApp
//
//  Created by Kaitlyn Zou on 12/6/23.
//

import SwiftUI

class Collection: ObservableObject{
    @Published var items = [JColorName]()
    
    func add(item: JColorName){
        items.append(item)
    }
    
    func remove(item: JColorName){
        if let index = items.firstIndex(of: item){
            items.remove(at: index)
        }
    }
}

