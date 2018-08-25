import UIKit

var arr = [ 5, 1, 4, 2, 8 ]

func bubbleSort(_ array: [Int]) -> [Int] {
    var vet = array
    
    for i in 0..<vet.count-1 {
        for j in 0..<vet.count-1-i {
            if vet[j] > vet[j+1] {
                vet.swapAt(j, j+1)
            }
        }
    }

    return vet
}

func insertionSort(_ array: [Int]) -> [Int] {
    var vet = array
    for i in 1..<vet.count {
        var n = i
        while n>0 && vet[n]<vet[n-1] {
            vet.swapAt(n-1, n)
            n -= 1
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
            vet.swapAt(min, i)
        }
    }
    
    return vet
}

print(bubbleSort(arr))
print(insertionSort(arr))
print(selectionSort(arr))
