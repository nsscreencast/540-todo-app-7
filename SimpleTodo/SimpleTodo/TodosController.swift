//
//  TodosController.swift
//  SimpleTodo
//
//  Created by Ben Scheirman on 10/14/22.
//

import Boutique
import SwiftUI

final class TodosController: ObservableObject {
    let store: Store<Todo>

    var todos: [Todo] {
        get async {
            await store.items
        }
    }

    init() {
        store = Store<Todo>(
            storage: SQLiteStorageEngine.default(appendingPath: "todos"),
            cacheIdentifier: \.id.uuidString
        )
    }

    func add(_ todo: Todo) {
        Task {
            do {
                try await store.add(todo)
            } catch {
                print(error)
            }
        }
    }

    func update(_ todo: Todo) {
        Task {
            do {
                try await store.add(todo)
            } catch {
                print(error)
            }
        }
    }

    func updateAll(_ todos: [Todo]) {
        Task {
            do {
                try await store.add(todos)
            } catch {
                print(error)
            }
        }
    }

    func remove(_ todo: Todo) {
        Task {
            do {
                try await store.remove(todo)
            } catch {
                print(error)
            }
        }
    }
}
