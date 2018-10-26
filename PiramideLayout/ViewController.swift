//
//  ViewController.swift
//  PiramideLayout
//
//  Created by swstation on 8/7/18.
//  Copyright © 2018 swstation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
var collectionData = ["🐱",
                " 🐰", " 🦊",
            " 🐯", " 🐿", " 🐹",
        " 🦆", " 🦉", " 🐬" , " 🐶" ,
       " 🦋"," 🦄"," 🐵 "," 🐝"," 🦁",
          "🧜🏼‍♀️", "🧚‍♀️",  "🌿",  "🌾",
              "🍇",   "🤹‍♀️",   "🎎",
                   "🧝🏻‍♀️", "🤡",
                      " 🎃"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel{
            label.text = collectionData[indexPath.item]
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        print(collectionData[indexPath.item])
    }
    
}

