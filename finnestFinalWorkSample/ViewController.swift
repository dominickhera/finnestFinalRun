//
//  ViewController.swift
//  finnestFinalWorkSample
//
//  Created by Dominick Hera on 10/12/18.
//  Copyright © 2018 Dominick Hera. All rights reserved.
//

import UIKit
private let itemHeight: CGFloat = 150
private let lineSpacing: CGFloat = 20
private let xInset: CGFloat = 10
private let topInset: CGFloat = 10

class ViewController: UIViewController  {
    
    let cellIdentifier = "CollectionViewCell"
    var itemCount = 1
    
    @IBOutlet weak var childCountLabel: UILabel!
    @IBOutlet weak var stepperBoxView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        self.childCountLabel.text = "\(itemCount)"
        collectionView.contentInset.bottom = itemHeight
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = UIEdgeInsets(top: topInset, left: 10, bottom: 0, right: 10)
        let itemWidth = ( UIScreen.main.bounds.width - 3 * xInset) / 2
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout.invalidateLayout()
        
    stepperBoxView.layer.cornerRadius = 14
        stepperBoxView.layer.shadowColor = UIColor.black.cgColor
        stepperBoxView.layer.shadowOpacity = 0.2
        stepperBoxView.layer.shadowOffset = CGSize(width: 0, height: 3)
        stepperBoxView.layer.masksToBounds = false
    }
    
    override func viewDidAppear(_ animated: Bool) {

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    
    @IBAction func incrementChildCount(_ sender: Any) {
        if (itemCount != 4){
            itemCount += 1
            self.childCountLabel.text = "\(itemCount)"
            let tempIndexPath = IndexPath(row: (itemCount - 1), section: 0)
            self.collectionView.insertItems(at: [tempIndexPath])
        }
    }
    
    @IBAction func decrementChildCount(_ sender: Any) {
        if (itemCount != 1){
            itemCount -= 1
            self.childCountLabel.text = "\(itemCount)"
            
            let tempIndexPath = IndexPath(row: (itemCount), section: 0)
            self.collectionView.deleteItems(at: [tempIndexPath])
        }
    }
    
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        
        let child = ChildManager.shared.childList[indexPath.row]
        cell.configureCell(child: child)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.flipCard((Any).self)
    }
}
extension ViewController: CollectionViewCellDelegate {
    func flipCard(cell: CollectionViewCell) {
        
        let flipped = cell.flipped
        let fromView = flipped ? cell.cellView : cell.backSideView
        let toView = flipped ? cell.backSideView : cell.cellView
        let flipDirection: UIView.AnimationOptions = flipped ? .transitionFlipFromRight : .transitionFlipFromLeft
        let options: UIView.AnimationOptions = [flipDirection, .showHideTransitionViews]
        UIView.transition(from: fromView!, to: toView!, duration: 0.6, options: options) {
            finished in
            cell.flipped = !flipped
        }
    }
    
}
