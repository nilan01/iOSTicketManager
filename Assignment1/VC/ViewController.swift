//
//  ViewController.swift
//  Assignment1
//
//  Created by user182271 on 10/9/20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var ticketObj = TicketApp()
    let balconyTickets = TicketApp.TicketType(level: "Balcony Level", inventory: 120, price: 500.00)
    let lowerTickets = TicketApp.TicketType(level: "Lower Level", inventory: 52, price: 1200.00)
    let courtsideTickets = TicketApp.TicketType(level: "Courtside", inventory: 22, price: 4200.00)
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var levelPicker: UIPickerView!
    @IBOutlet weak var orderTest: UILabel!
    //var levels = [String]()
    var arrayOfTickets : [TicketApp.TicketType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfTickets = [balconyTickets, lowerTickets, courtsideTickets]
        totalPrice.text = "0"
        levelLabel.text = arrayOfTickets[0].ticketLevel
        quantity.text = "0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        levelPicker.reloadComponent(0)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }

    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return arrayOfTickets.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return  "\(arrayOfTickets[row].ticketLevel) Ticket" + " " + "\(arrayOfTickets[row].ticketInventory)" + "Price:" + "\(arrayOfTickets[row].ticketPrice)"
    }
    
    @IBAction func digitPressed(_ sender: Any) {
        let button = sender as! UIButton
        quantity.text = button.currentTitle
        let unwrappedQuantity : Double = Double(quantity.text!)!
        for ticket in arrayOfTickets{
            if levelLabel.text == ticket.ticketLevel{
                totalPrice.text = String(unwrappedQuantity * ticket.ticketPrice)
            }
        }
    }
 
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //levelLabel.text = row.description
        if row.description == "0"{
            levelLabel.text = arrayOfTickets[0].ticketLevel
        }else if row.description == "1"{
            levelLabel.text = arrayOfTickets[1].ticketLevel
        }else if row.description == "2"{
            levelLabel.text = arrayOfTickets[2].ticketLevel
        }
    }
    
    @IBAction func buyPressed(_ sender: Any) {
        let ticketsPurchased = Int(quantity.text!)!
        var total : Double = 0.00
        for ticket in arrayOfTickets{
            if levelLabel.text == ticket.ticketLevel{
                total = ticketObj.calculateTotal(quantity: ticketsPurchased, price: ticket.ticketPrice)
                ticket.ticketInventory = ticket.ticketInventory - ticketsPurchased
                ticketObj.placeOrder(selectedLevel: ticket.ticketLevel, selectedQuantity: ticketsPurchased, calculatedTotal: total)
            }
        }
        levelPicker.reloadComponent(0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let manager : Manager = segue.destination as! Manager
        let orders = ticketObj.orders
        manager.valueFromVC = orders
        let ticketTypes = arrayOfTickets
        manager.arrayOfTicketsFromVC = ticketTypes
        let ticketApp = ticketObj
        manager.ticketAppFromVC = ticketApp
    }
  
}
