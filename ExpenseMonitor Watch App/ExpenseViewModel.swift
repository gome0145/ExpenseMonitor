//
//  ExpenseViewModel.swift
//  ExpenseMonitor Watch App
//
//  Created by Montserrat Gomez on 2023-12-04.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject {
	
	@Published var expense: [Expense] = []
	
	
	func addExpense(title: String, amount: String, category: String) {
		let newExpense = Expense(title: title, amount: amount, category: category)
		
		expense.append(newExpense)
	}
	
	func removeExpense(at offssets: IndexSet ){
		expense.remove(atOffsets: offssets)
	}
	
	func saveExpense(){
		if let encodeData = try? JSONEncoder().encode(expense){
			UserDefaults.standard.set(encodeData, forKey: "expense") //para mantener guardada la informacion aunque se cierre la app
		}
	}
	
	func totalExpenses() -> Double{
		var total = 0.0
		
		for element in expense {
			total += Double(element.amount) ?? 0.0
		}
		
		return total
	}
	
	init(){
		if let expenseData = UserDefaults.standard.data(forKey: "expense"),
		let decodeData = try? JSONDecoder().decode([Expense].self, from: expenseData){
			expense = decodeData
			
		}
	}
	
	
}
