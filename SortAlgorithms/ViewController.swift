//
//  ViewController.swift
//  SortAlgorithms
//
//  Created by Djorkaeff Alexandre Vilela Pereira on 21/08/2018.
//  Copyright © 2018 Djorkaeff Alexandre Vilela Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "CellIdentifier"
    
    @IBOutlet weak var table: UITableView!
    
    var numbers = [Int]()
    
    var algorithms = Algorithms()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        numbers = [753, 93, 122, 425, 249, 579, 324, 314, 511, 488, 23, 195, 61, 519, 306, 460, 898, 726, 210, 874, 93, 215, 98, 530, 185, 114, 432, 655, 44, 614, 486, 453, 653, 839, 343, 951, 654, 780, 974, 799, 305, 25, 229, 63, 213, 558, 261, 209, 214, 243, 644, 382, 388, 90, 22, 680, 219, 493, 677, 706, 584, 191, 833, 359, 704, 261, 105, 786, 308, 387, 146, 797, 436, 56, 843, 303, 491, 774, 489, 822, 354, 590, 13, 399, 938, 447, 567, 743, 499, 41, 544, 313, 680, 768, 228, 491, 88, 698, 941, 41, 616, 196, 171, 688, 320, 577, 910, 958, 664, 491, 627, 863, 838, 676, 328, 178, 740, 71, 113, 421, 438, 450, 665, 554, 672, 763, 556, 3, 139, 264, 971, 737, 735, 477, 924, 175, 855, 734, 841, 424, 713, 430, 169, 880, 234, 190, 737, 832, 854, 1, 57, 675, 273, 798, 468, 216, 376, 929, 675, 88, 333, 990, 295, 662, 934, 788, 362, 238, 790, 250, 389, 289, 793, 72, 121, 701, 842, 358, 731, 883, 13, 463, 816, 903, 758, 868, 516, 450, 59, 529, 510, 666, 940, 843, 424, 716, 250, 128, 264, 292, 195, 625, 664, 476, 38, 218, 753, 959, 711, 323, 74, 46, 911, 612, 370, 794, 565, 672, 222, 749, 967, 170, 310, 961, 947, 499, 42, 593, 900, 575, 4, 338, 237, 528, 212, 108, 962, 836, 683, 961, 103, 692, 281, 629, 487, 817, 251, 626, 433, 389, 340, 377, 186, 704, 617, 848, 31, 230, 221, 870, 56, 119, 657, 610, 676, 499, 36, 8, 312, 871, 507, 920, 422, 7, 508, 522, 898, 571, 859, 948, 304, 557, 532, 366, 850, 867, 687, 673, 465, 954, 185, 417, 298, 153, 649, 235, 970, 462, 536, 633, 878, 8, 942, 642, 638, 267, 767, 71, 118, 636, 323, 210, 207, 885, 77, 730, 508, 994, 467, 544, 20, 263, 17, 826, 309, 256, 975, 951, 973, 593, 875, 851, 274, 464, 896, 644, 263, 932, 356, 829, 521, 711, 467, 903, 143, 840, 684, 208, 470, 928, 743, 733, 205, 14, 340, 692, 357, 655, 847, 620, 365, 621, 9, 482, 520, 784, 184, 625, 917, 576, 120, 718, 382, 693, 177, 529, 215, 853, 774, 952, 568, 554, 259, 782, 259, 520, 327, 71, 682, 712, 191, 839, 394, 475, 652, 860, 550, 208, 482, 843, 714, 762, 873, 702, 755, 418, 36, 4, 124, 340, 432, 925, 688, 604, 478, 265, 347, 382, 351, 999, 678, 783, 475, 469, 499, 894, 277, 619, 214, 184, 454, 87, 675, 13, 921, 429, 44, 358, 789, 648, 223, 330, 318, 986, 603, 881, 130, 362, 483, 883, 433, 915, 166, 733, 422, 182, 697, 130, 44, 969, 863, 103, 960, 429, 344, 804, 99, 87, 958, 842, 169, 783, 995, 677, 767, 833, 274, 975, 104, 57, 430, 45, 586, 989, 12, 868, 627, 387, 291, 155, 560, 693, 642, 613, 320, 222, 837, 598, 818, 591, 930, 247, 58, 227, 662, 516, 755, 12, 680, 522, 765, 314, 297, 424, 782, 86, 781, 41, 262, 380, 304, 857, 963, 284, 82, 636, 469, 374, 851, 63, 946, 463, 975, 728, 802, 941, 771, 376, 694, 469, 165, 365, 31, 181, 292, 924, 633, 570, 480, 898, 659, 856, 423, 711, 915, 824, 223, 904, 517, 753, 211, 20, 171, 854, 56, 721, 480, 746, 785, 340, 706, 660, 276, 416, 446, 233, 407, 220, 821, 693, 450, 244, 216, 512, 152, 163, 870, 215, 553, 565, 663, 92, 997, 577, 436, 415, 920, 180, 460, 317, 151, 710, 289, 394, 699, 42, 383, 184, 931, 84, 410, 544, 528, 545, 944, 558, 112, 939, 935, 875, 836, 577, 498, 342, 844, 60, 255, 469, 577, 138, 975, 100, 361, 151, 755, 672, 336, 369, 501, 257, 422, 563, 501, 940, 888, 333, 907, 870, 371, 540, 430, 272, 214, 509, 459, 792, 65, 960, 424, 75, 100, 192, 494, 245, 474, 653, 26, 264, 187, 599, 689, 480, 914, 52, 240, 837, 921, 809, 267, 371, 856, 48, 553, 882, 895, 9, 22, 69, 383, 293, 802, 523, 668, 391, 626, 503, 241, 704, 785, 492, 437, 236, 671, 90, 833, 449, 286, 772, 687, 491, 203, 288, 981, 754, 552, 32, 598, 446, 64, 898, 384, 762, 232, 607, 314, 669, 540, 557, 614, 107, 524, 204, 39, 154, 114, 359, 433, 904, 676, 106, 451, 516, 939, 521, 259, 230, 84, 334, 57, 101, 103, 256, 130, 368, 550, 714, 164, 218, 709, 39, 840, 969, 757, 559, 749, 911, 739, 160, 350, 907, 842, 930, 152, 936, 837, 792, 911, 29, 514, 168, 85, 978, 653, 272, 422, 813, 507, 886, 430, 612, 247, 447, 753, 252, 709, 276, 81, 863, 467, 105, 251, 989, 537, 873, 460, 151, 885, 577, 612, 45, 367, 739, 612, 635, 267, 431, 697, 589, 164, 987, 771, 216, 350, 207, 426, 412, 50, 906, 504, 940, 663, 601, 908, 256, 96, 827, 446, 939, 534, 568, 876, 483, 200, 166, 14, 788, 448, 576, 946, 428, 924, 597, 701, 69, 709, 628, 689, 805, 911, 238, 978, 408, 516, 439, 347, 537, 168, 960, 425, 188, 844, 595, 936, 676, 929, 509, 180, 223, 581, 777, 871, 929, 46, 459, 795, 449, 773, 473, 175, 381, 839, 101, 722, 782, 517, 776, 777, 528, 47, 963, 572, 642, 581, 675, 378, 664, 704, 632, 241, 352, 233, 790, 420, 262, 247, 920, 33, 809, 192, 838, 326, 358, 754, 644, 383, 195, 517, 350, 607, 974, 546, 922, 512, 11, 106, 545, 679, 767, 263, 593, 711, 222, 440, 762, 544, 899, 904, 423, 794, 520, 610, 281, 433, 589, 935, 881, 563, 819, 119, 121, 286, 812, 79, 580, 120, 470, 482, 702, 543, 214, 604, 962, 676, 47, 589, 457, 358, 713, 551, 360, 137, 127, 724, 578, 994, 801, 279, 884, 505, 608, 585, 337, 642, 952, 450, 866, 625, 961, 868, 542]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = String(numbers[indexPath.row])
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var numbersSort = [Int]()
        if segue.identifier == "insertion" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.insertionSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        } else if segue.identifier == "selection" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.selectionSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        } else if segue.identifier == "bubble" {
            guard let viewController = segue.destination as? SortViewController else { return }
            
            let startTime = CFAbsoluteTimeGetCurrent()
            numbersSort = algorithms.bubbleSort(numbers)
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            
            viewController.lblTime = String(timeElapsed) + "(s)"
            viewController.numbers = numbersSort
            viewController.lblSort = segue.identifier!
        }
    }
}
