//
//  Reset.swift
//  Assignment1
//
//  Created by user182271 on 10/15/20.
//

import UIKit

class Reset: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var valueFromManager : [TicketApp.Order] = []
    var arrayOfTicketsFromManager : [TicketApp.TicketType] = []
    var ticketAppFromManager = TicketApp()
    
    @IBOutlet weak var ticketTypes: UIPickerView!
    @IBOutlet weak var confirmResetButton: UIButton!
    @IBOutlet weak var resetQuantity: UITextField!
    @IBOutlet weak var ticketType: UILabel!
    
    var selectedLevel : String = "Balcony Level"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(arrayOfTicketsFromManager[row].ticketLevel) Ticket" + " " + "\(arrayOfTicketsFromManager[row].ticketInventory)" + "Price:" + "\(arrayOfTicketsFromManager[row].ticketPrice)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        //levelLabel.text = row.description
        if row.description == "0"{
            selectedLevel = arrayOfTicketsFromManager[0].ticketLevel
        }else if row.description == "1"{
            selectedLevel = arrayOfTicketsFromManager[1].ticketLevel
        }else if row.description == "2"{
            selectedLevel = arrayOfTicketsFromManager[2].ticketLevel
        }
    }
    
    @IBAction func confirmUpdate(_ sender: Any) {
        let quantityAdd : Int = Int(resetQuantity.text!)!
        for ticket in arrayOfTicketsFromManager{
            if selectedLevel == ticket.ticketLevel{
                ticket.ticketInventory = ticketAppFromManager.update(currentAmt: ticket.ticketInventory, amtToAdd: quantityAdd);
            }
        }
        ticketTypes.reloadComponent(0)
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
