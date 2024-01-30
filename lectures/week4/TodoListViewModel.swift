//
//  TodoListViewModel.swift
//  swift_peercoaching
//
//  Created by Yeonsu Seo on 1/30/24.
//

// ViewModel
import Foundation

class TodoListViewModel: ObservableObject { //ObservableObject ? 관찰당한다는 뜻. ViewModel 은 계속 변동이 일어나니까 데이터가 바뀌면 View 가 업데이트 되어야함.
    
    //Todo 여러개 있어야되니까 배열이 필요
    @Published var todos: [TodoItem] = [] //그냥 public 생각하면 됨
    
    func addTodo(title: String) {
        let newTodo = TodoItem(title: title)
        todos.append(newTodo)
    }
    
    func delTodo(at indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
    
    func toggleTodoCompletion(todo: TodoItem) {
        if let index = todos.firstIndex(where: {$0.id == todo.id})
        {
            todos[index].isCompleted.toggle()
        }
    }
}
