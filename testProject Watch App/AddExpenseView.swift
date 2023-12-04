//
//  AddExpenseView.swift
//  testProject Watch App
//
//  Created by Adesh Shah on 2023-11-30.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var viewModel: ExpensesViewModel
    @State private var title = ""
    @State private var amount = 0.0
    @State private var selectedCategory = "Groceries"

    let categories = ["Groceries", "Drinks", "Food", "Others"]

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Amount", value: $amount, formatter: NumberFormatter())
            }

            Section {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
            }

            Section {
                Button("Save") {
                    viewModel.addExpense(title: title, amount: amount, category: selectedCategory)
                }
            }
        }
        .navigationTitle("Add Expense")
    }
}
