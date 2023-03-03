//
//  HomeViewController.swift
//  Yummie
//
//  Created by Berkay Kuzu on 11.12.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = []
    var populars: [Dish] = []
    var specials : [Dish] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        registerCells()
        
        categories = [
            DishCategory(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
            DishCategory(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
            DishCategory(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
            DishCategory(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
            DishCategory(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
        ]
        
        populars = [
            Dish(id: "id1", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
            Dish(id: "id1", name: "Indomie", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
            Dish(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1004)
        ]
        
        specials = [
            Dish(id: "id1", name: "Fried Plantain", description: "This is my favorite dish", image: "https://picsum.photos/100/200", calories: 314),
            Dish(id: "id1", name: "Beans and Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1004),
            Dish(id: "id1", name: "Boeuf Bourguignon", description: "This is the specials known all over the world", image: "https://picsum.photos/100/200", calories: 502)
        ]
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row] // Different syntax!!!
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
