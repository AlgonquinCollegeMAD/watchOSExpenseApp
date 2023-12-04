//
//  ExpensesViewModel.swift
//  testProject Watch App
//
//  Created by Adesh Shah on 2023-11-30.
//


import SwiftUI

class ExpensesViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    func addExpense(title: String, amount: Double, category: String) {
        let newExpense = Expense(title: title, amount: amount, category: category)
        expenses.append(newExpense)
        saveExpenses()
    }

    func removeExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
        saveExpenses()
    }

    private func saveExpenses() {
        if let encodedData = try? JSONEncoder().encode(expenses) {
            UserDefaults.standard.set(encodedData, forKey: "expenses")
        }
    }

    init() {
        if let expensesData = UserDefaults.standard.data(forKey: "expenses"),
           let decodedExpenses = try? JSONDecoder().decode([Expense].self, from: expensesData) {
            expenses = decodedExpenses
        }
    }
}
