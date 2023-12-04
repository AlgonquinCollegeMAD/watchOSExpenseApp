//
//  Expense.swift
//  testProject Watch App
//
//  Created by Adesh Shah on 2023-11-30.
//



import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Double
    var category: String
}


