//
//  Algorithms.swift
//  SortAlgorithms
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 25/08/2018.
//  Copyright © 2018 Djorkaeff Alexandre Vilela Pereira. All rights reserved.
//

import UIKit

class Algorithms: NSObject {
    func insertionSort(_ array: [Int]) -> [Int] {
        var vet = array
        for x in 1..<vet.count {
            var y = x
            while y > 0 && vet[y] < vet[y - 1] {
                vet.swapAt(y - 1, y)
                y -= 1
            }
        }
        return vet
    }
    
    func selectionSort(_ array: [Int]) -> [Int] {
        var vet = array
        for i in 0..<vet.count-1 {
            var min = i
            for j in i+1..<vet.count {
                if vet[j] < vet[min] {
                    min = j
                }
            }
            if vet[i] != vet[min] {
                vet.swapAt(i, min)
            }
        }
        return vet
    }
    
    func bubbleSort(_ array: [Int]) -> [Int] {
        var vet = array
        for x in 0..<vet.count-1 {
            for y in x+1..<vet.count {
                if vet[y] < vet[x] {
                    vet.swapAt(x, y)
                }
            }
        }
        return vet
    }
}
