//
//  ListDishesViewController.swift
//  Yummie
//
//  Created by Berkay Kuzu on 3.03.2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    var category: DishCategory!
    var dishes: [Dish] = []
    
    @IBOutlet weak var listDishesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.title
        registerCells()
        
        dishes = [
            Dish(id: "id1", name: "Garri", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 34),
            Dish(id: "id1", name: "Indomie", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 314),
            Dish(id: "id1", name: "Pizza", description: "This is the best I have ever tasted", image: "https://picsum.photos/100/200", calories: 1004)
        ]
    }
    
    private func registerCells() {
        listDishesTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
