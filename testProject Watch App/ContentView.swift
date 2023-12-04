//
//  ContentView.swift
//  testProject Watch App
//
//  Created by Adesh Shah on 2023-11-30.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ExpensesViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.expenses) { expense in
                    VStack(alignment: .leading) {
                        Text("\(expense.title): $\(expense.amount, specifier: "%.2f")")
                        Text("Category: \(expense.category)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .onDelete(perform: viewModel.removeExpense)
            }
            .navigationTitle("Expenses")
            .toolbar {
                NavigationLink("Add", destination: AddExpenseView(viewModel: viewModel))
            }
        }
    }
}
