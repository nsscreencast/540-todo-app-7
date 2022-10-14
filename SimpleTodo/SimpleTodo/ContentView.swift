import SwiftUI
import Boutique

struct ContentView: View {
    @StateObject var todosController = TodosController()

    var body: some View {
        TodoList(controller: todosController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
