//
//  TicketApp.swift
//  Assignment1
//
//  Created by user182271 on 10/9/20.
//

import Foundation

public class TicketApp{
   
    class Order{
        var orderLevel : String = ""
        var orderQuantity : Int = 0
        var orderTotal : Double = 0.00
        var orderDate: Date
        
        init(level: String, quantity : Int, total : Double){
            //super.init()
            orderLevel = level
            orderQuantity = quantity
            orderTotal = total
            orderDate = Date()
        }
    }
    
    class TicketType{
        var ticketLevel : String = ""
        var ticketInventory : Int = 0
        var ticketPrice : Double = 0.00
        var numberOfTypes : Int = 0
        
        init(level: String, inventory: Int, price: Double){
            ticketLevel = level
            ticketInventory = inventory
            ticketPrice = price
            numberOfTypes += 1
        }
    }
    
    var orders : [Order] = []
    
    var total : Double = 0.00;
        
    func calculateTotal(quantity: Int, price: Double) -> Double{
        var tempTotal : Double = 0
        tempTotal = Double(quantity) * price
        return tempTotal
    }
    func placeOrder(selectedLevel : String, selectedQuantity : Int, calculatedTotal : Double){
        let order = Order(level: selectedLevel, quantity: selectedQuantity, total: calculatedTotal)
        orders.append(order)
    }
    func update(currentAmt : Int, amtToAdd: Int) -> Int{
        return currentAmt + amtToAdd
    }
}
