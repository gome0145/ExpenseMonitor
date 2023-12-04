//
//  AddExpenseView.swift
//  ExpenseMonitor Watch App
//
//  Created by Montserrat Gomez on 2023-12-04.
//

import SwiftUI
import SwiftUI_Apple_Watch_Decimal_Pad

struct AddExpenseView: View {
	@ObservedObject var viewModel: ExpenseViewModel
	@State private var title = ""
	@State private var amount = ""
	@State private var selectedCategory = "Groceries"
	
	let categories = ["Groceries", "Food", "Drinks", "Other"]
	
	let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		return formatter
	}()
	
	@State public var presentingModal: Bool
	
	@Environment(\.presentationMode) var presentationMode
	@State var isSaved = false
	
	
	var body: some View {
		Form {
			Section {
				TextField("Title", text: $title)
				
				DigiTextView(placeholder: "amount",
							 text: $amount,
							 presentingModal: presentingModal,
							 style: .decimal
				)
				
			}
			
			Section{
				Picker("Category", selection: $selectedCategory){
					ForEach(categories, id: \.self) {
						Text($0)
					}
				}
			}
			Section {
				Button("Save") {
					viewModel.addExpense(title: title, amount: amount, category: selectedCategory)
					isSaved = true
				}
			}
		}.navigationTitle("Add Expense")
			.alert(isPresented: $isSaved) {
				Alert(
					title: Text("Save"),
					message: Text("Your data has been saved"),
					dismissButton: .default(Text("Ok"), action: {
						presentationMode.wrappedValue.dismiss()
					})
				)
			}
	}
}
	
