////
////  ToDoList.swift
////  Contento
////
////  Created by Sanchitha Dinesh on 3/17/20.
////  Copyright © 2020 Sanchitha. All rights reserved.
////
//
import SwiftUI
import Combine
import CoreML
import CoreData
import NotificationCenter
import UserNotifications

struct ToDoList: View {
    @State var currentDate = Date()
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
     var suggestions: [String: Double] = ["Call Lily": 3.0, "Library Visit": 3.5]
    var recommender = Contento_Recommender_1()

    @ObservedObject var taskRecommendations = Recommender()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var todoItems:FetchedResults<ToDoItem>
    @State private var newToDoItem = ""
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's next?")) {
                    HStack {
                        TextField("New item", text: self.$newToDoItem)
                        Button(action: {
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title = self.newToDoItem
                            toDoItem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            
                            self.newToDoItem = ""
                    
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }
                .font(.headline)
                
                Section(header: Text("Tasks")) {
                    ForEach(self.todoItems) { todoItem in
                        ToDoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)" )
                    }.onDelete { indexSet in
                        let deleteItem = self.todoItems[indexSet.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print(error)
                        }
                        
                    }
                }
                Section(header: Text("Suggested Tasks")) {
                    ForEach(taskRecommendations.tasks) { task in
                        VStack (alignment: .leading) {
                            Text(task.name)
                        }
                    }
                }
            }
                .environment(\.defaultMinListRowHeight, 75)
            .navigationBarTitle("To-Do")
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}
public class Recommender: ObservableObject {
    
    @Published var tasks = [Task]()
    @Published var suggestions: [String: Double] = ["Call Lily": 3.0, "Library Visit": 3.5]
    @Published var recommender = Contento_Recommender_1()
    
    init(){
        load()
    }
    
    func load() {
        do{
            
            let input = Contento_Recommender_1Input(items: suggestions, k: 10, restrict_: [], exclude: [])
            
            let result = try recommender.prediction(input: input)
            var tempTask = [Task]()
            
            for str in result.recommendations{
                let score = result.scores[str] ?? 0
                tempTask.append(Task(name: "\(str)", score: score))
            }
            self.tasks = tempTask
            
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
        
    }
}
struct Task: Identifiable {
    public var id = UUID()
    public var name: String
    public var score: Double
    
}
