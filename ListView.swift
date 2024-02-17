//
//  ContentView.swift
//  Rohan
//
//  Created by Rohan Sakhare on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var students = ["Aditya", "Chakradhar", "Shubham", "Rohan", "Prathmesh", "Omkar"]
    @State var cstudent = ["Rahul", "Etisha", "Shravani", "Sachin", "Komal"]
    @State var astudents = ["Aditya", "Akashy", "Shubham", "Atharv", "Prathmesh", "Shantunu"]
    @State var bstudents = ["Pranali", "Priyanka", "Neha", "Anuj", "Pranav", "Soham"]
    @State private var isDivisionDCollapsed = false
    @State private var isDivisionCCollapsed = false
    @State private var isDivisionACollapsed = false
    @State private var isDivisionBCollapsed = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: sectionHeader("Division A", isCollapsed: $isDivisionACollapsed)) {
                    if !isDivisionACollapsed {
                        ForEach(astudents, id: \.self) { student in
                            Text(student)
                        }
                        .onDelete(perform: deletea)
                        .onMove(perform: moveA)
                    }
                }
                Section(header: sectionHeader("Division B", isCollapsed: $isDivisionBCollapsed)) {
                    if !isDivisionBCollapsed {
                        ForEach(bstudents, id: \.self) { student in
                            Text(student)
                        }
                        .onDelete(perform: deleteB)
                        .onMove(perform: moveB)
                    }
                }
                
                Section(header: sectionHeader("Division C", isCollapsed: $isDivisionCCollapsed)) {
                    if !isDivisionCCollapsed {
                        ForEach(cstudent, id: \.self) { student in
                            Text(student)
                        }
                        .onDelete(perform: deleteC)
                        .onMove(perform: moveC)
                    }
                }
                Section(header: sectionHeader("Division D", isCollapsed: $isDivisionDCollapsed)) {
                    if !isDivisionDCollapsed {
                        ForEach(students, id: \.self) { student in
                            Text(student)
                        }
                        .onDelete(perform: deleteD)
                        .onMove(perform: moveD)
                    }
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Students List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .accentColor(.red)
    }
    
    var addButton: some View {
        Button("Add", action: { addStudent() })
    }
    
    func sectionHeader(_ title: String, isCollapsed: Binding<Bool>) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.purple)
            Spacer()
            Image(systemName: isCollapsed.wrappedValue ? "chevron.down" : "chevron.up")
                .imageScale(.large)
                .foregroundColor(.gray)
                .onTapGesture {
                    withAnimation {
                        isCollapsed.wrappedValue.toggle()
                    }
                }
        }
    }
    
    func deleteD(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }
    
    func deletea(at offsets: IndexSet) {
        astudents.remove(atOffsets: offsets)
    }
    
    func deleteB(at offsets: IndexSet) {
        bstudents.remove(atOffsets: offsets)
    }
    
    func deleteC(at offsets: IndexSet) {
        cstudent.remove(atOffsets: offsets)
    }
    
    func moveD(from source: IndexSet, to destination: Int) {
        students.move(fromOffsets: source, toOffset: destination)
    }
    
    func moveA(from source: IndexSet, to destination: Int) {
        astudents.move(fromOffsets: source, toOffset: destination)
    }
    
    func moveB(from source: IndexSet, to destination: Int) {
        bstudents.move(fromOffsets: source, toOffset: destination)
    }
    
    func moveC(from source: IndexSet, to destination: Int) {
        cstudent.move(fromOffsets: source, toOffset: destination)
    }
    
    func addStudent() {
        students.append("Prakash")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
