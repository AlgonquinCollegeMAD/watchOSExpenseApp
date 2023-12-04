//
//  DaySelectorView.swift
//  testProject Watch App
//
//  Created by Adesh Shah on 2023-11-30.
//

import SwiftUI

struct DaySelectorView: View {
    @Binding var selectedDate: Date

    var body: some View {
        List {
            DatePicker("Select a day", selection: $selectedDate, displayedComponents: [.date])
        }
    }
}
