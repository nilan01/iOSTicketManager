//
//  Manager.swift
//  Assignment1
//
//  Created by user182271 on 10/14/20.
//

import UIKit

class Manager: UIViewController {

    var valueFromVC : [TicketApp.Order] = []
    var arrayOfTicketsFromVC : [TicketApp.TicketType] = []
    var ticketAppFromVC = TicketApp()

    @IBOutlet weak var orderFromManager: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // add if to check segue identifier
        if (segue.identifier == "historySegue"){
            let history : History = segue.destination as! History
            let orders = valueFromVC
            history.valueFromManager = orders
        }else {
            let reset : Reset = segue.destination as! Reset
            let ticketTypes = arrayOfTicketsFromVC
            reset.arrayOfTicketsFromManager = ticketTypes
            let ticketApp = ticketAppFromVC
            reset.ticketAppFromManager = ticketApp
        }
    }
}
