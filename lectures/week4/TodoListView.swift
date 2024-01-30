//
//  TodoListView.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/30/24.
//

import SwiftUI

struct TodoListView: View {
    
    private var vm = TodoListViewModel()
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    // id:.\self 안해줘도 되는 이유는 vm 속 identifiable 속성 때문
                    ForEach(vm.todos) { todo in
                        HStack {
                            Button {
                                vm.toggleTodoCompletion(todo: todo)
                                
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark.square" : "square")
                            }.buttonStyle(.borderless)
                            
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                                .foregroundColor(todo.isCompleted ? .gray : .black)
                        }
                        
                    }.onDelete(perform: vm.delTodo)
                }
                HStack {
                    TextField("New Todo", text: $newTodoTitle)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        vm.addTodo(title: newTodoTitle)
                        newTodoTitle = ""
                    } label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                }.padding()
                
            }.navigationTitle("TodoList")
                .navigationBarItems(trailing: EditButton())
            
        }
    }
}

#Preview {
    TodoListView()
}
