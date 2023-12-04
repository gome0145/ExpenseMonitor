//
//  Expense.swift
//  ExpenseMonitor Watch App
//
//  Created by Montserrat Gomez on 2023-12-04.
//

import Foundation


struct Expense: Identifiable, Codable {
	var id = UUID()
	var title: String
	var amount: String
	var category : String

}
