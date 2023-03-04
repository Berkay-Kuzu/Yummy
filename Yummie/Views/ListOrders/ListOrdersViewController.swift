//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Berkay Kuzu on 3.03.2023.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var listOrdersTableView: UITableView!
    
    //var orders: [Order] = [] // 1st way of creating an empty array
    var orders = [Order]() // 2nd way of creating an empty array

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerCell()
        title = "Orders"
        
        orders = [
        Order(id: "id", name: "Berkay Kuzu", dish: Dish(id: "id1", name: "Steak and French Fries", description: "The most delicious French food", image: "https://picsum.photos/100/200", calories: 440)),
        Order(id: "id", name: "İrem Elhan", dish: Dish(id: "id1", name: "Steak and French Fries", description: "The most delicious French food", image: "https://picsum.photos/100/200", calories: 440)),
        Order(id: "id", name: "Michael Scofield", dish: Dish(id: "id1", name: "Steak and French Fries", description: "The most delicious French food", image: "https://picsum.photos/100/200", calories: 440)),
        Order(id: "id", name: "Lincoln Burrows", dish: Dish(id: "id1", name: "Steak and French Fries", description: "The most delicious French food", image: "https://picsum.photos/100/200", calories: 440))
        ]
        
    }
    
    private func registerCell () {
        listOrdersTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}

