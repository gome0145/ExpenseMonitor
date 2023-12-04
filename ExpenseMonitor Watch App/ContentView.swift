//
//  ContentView.swift
//  ExpenseMonitor Watch App
//
//  Created by Montserrat Gomez on 2023-12-04.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel = ExpenseViewModel()
	
	
    var body: some View {
		NavigationView{
			List {
				ForEach(viewModel.expense){ element in
					VStack(alignment: .leading){
						Text("\(element.title): $ \(String(element.amount))")
						Text("Category: \(element.category)")
							.font(.caption)
							.foregroundStyle(Color.gray)
					}
					
				}
				.onDelete(perform: viewModel.removeExpense)
				
				Text("Total: \(viewModel.totalExpenses(), specifier: "%.2f")")
			}
			.navigationTitle("Expenses")
			.toolbar{
				NavigationLink("Add", destination: AddExpenseView(viewModel: viewModel, presentingModal: false))
			}
		}
    }
}

//#Preview {
//    ContentView()
//}
