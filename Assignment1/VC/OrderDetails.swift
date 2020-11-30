//
//  OrderDetails.swift
//  Assignment1
//
//  Created by user182271 on 10/15/20.
//

import UIKit

class OrderDetails: UIViewController {

    var valueFromHistory : TicketApp.Order = TicketApp.Order(level: "", quantity: 0, total: 0.00)
    var valueFromHistoryArray : [TicketApp.Order] = []
    var iOD = 0
    
    @IBOutlet weak var itemDetail: UILabel!
    @IBOutlet weak var quantityDetail: UILabel!
    @IBOutlet weak var totalDetail: UILabel!
    @IBOutlet weak var dateDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemDetail.text = valueFromHistoryArray[iOD].orderLevel
        quantityDetail.text = "\(valueFromHistoryArray[iOD].orderQuantity)"
        totalDetail.text = "\(valueFromHistoryArray[iOD].orderTotal)"
        dateDetail.text = "\(valueFromHistoryArray[iOD].orderDate)"
        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
