//
//  History.swift
//  Assignment1
//
//  Created by user182271 on 10/14/20.
//

import UIKit

class History: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var valueFromManager : [TicketApp.Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valueFromManager.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
        cell?.textLabel?.text = valueFromManager[indexPath.row].orderLevel
        cell?.detailTextLabel?.text = "\(valueFromManager[indexPath.row].orderQuantity)"
        return cell!
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var i = 0
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOrder = valueFromManager[indexPath.row]
        i = indexPath.row + 1
        if let viewController = storyboard?.instantiateViewController(identifier: "OrderDetails") as? OrderDetails {
            viewController.valueFromHistory = selectedOrder
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let orderDetails : OrderDetails = segue.destination as! OrderDetails
        let orders : [TicketApp.Order] = valueFromManager
        orderDetails.valueFromHistoryArray = orders
        orderDetails.iOD = i
    }
}
