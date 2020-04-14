//
//  MainViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 13.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var shopItems = [Shop]()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        addItems()
        print(shopItems)
    }

    func addItems(){
        
//            let newItemCarhartt = Shop(imageName: "carhartt\(i).jpg", nameOfBrand: "carhartt", price: 120*i)
        let newItemStone1 = Shop(imageName: "stone1.jpg", nameOfBrand: "Stone Island", price: 1001)
        let newItemStone2 = Shop(imageName: "stone2.jpg", nameOfBrand: "Stone Island", price: 100*2)
        let newItemStone3 = Shop(imageName: "stone3.jpg", nameOfBrand: "Stone Island", price: 100*3)
        let newItemStone4 = Shop(imageName: "stone4.jpg", nameOfBrand: "Stone Island", price: 100*4)
        let newItemPalace1 = Shop(imageName: "palace1.jpg", nameOfBrand: "Palace", price: 50*1)
        let newItemPalace2 = Shop(imageName: "palace2.jpg", nameOfBrand: "Palace", price: 50*2)
        let newItemPalace3 = Shop(imageName: "palace3.jpg", nameOfBrand: "Palace", price: 50*3)
        let newItemPalace4 = Shop(imageName: "palace4.jpg", nameOfBrand: "Palace", price: 50*4)
            //shopItems.append(newItemCarhartt)
        shopItems.append(newItemStone1)
        shopItems.append(newItemStone2)
        shopItems.append(newItemStone3)
        shopItems.append(newItemStone4)
        shopItems.append(newItemPalace1)
        shopItems.append(newItemPalace2)
        shopItems.append(newItemPalace3)
        shopItems.append(newItemPalace4)
    }
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
        
    }
   
    }

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopItems.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCollectionViewCell{
        let item = shopItems[indexPath.row]
        cell.reload(item)
            return cell}
        return UICollectionViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard let vc = segue.destination as? ItemViewController else{return}
        if let indexPath = mainCollectionView.indexPathsForSelectedItems{
            if let last = indexPath.last{
        let item = shopItems[last.row]
        vc.imageName = item.imageName
        vc.price = "\(item.price)"
        vc.nameOfBrand = item.nameOfBrand
            }}}
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
              return CGSize(width: 160, height: 186)
          }
    }
