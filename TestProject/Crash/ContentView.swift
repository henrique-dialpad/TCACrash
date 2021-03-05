//
//  ContentView.swift
//  TestProject
//
//  Created by Henrique Forioni de Lima on 03/03/21.
//

import SwiftUI
import ComposableArchitecture

struct AppState: Equatable {
  var items: IdentifiedArrayOf<ItemState>
}

enum AppAction {
  case item(id: Int, action: ItemAction)
  case onAppear
  case updateItems
}

struct AppEnvironment {
  var didTapClearButton: Effect<Void, Never>
}

let appEnvironment = AppEnvironment(
  didTapClearButton: NotificationCenter.default
    .publisher(for: Notification.Name("Testing"))
    .map { _ in () }
    .receive(on: DispatchQueue.main)
    .eraseToEffect()
)

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
  
  itemReducer.forEach(
    state: \.items,
    action: /AppAction.item(id:action:),
    environment: { _ in ()}),

  Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
      print("Listening for notifications")
      return environment
        .didTapClearButton
        .map { _ in .updateItems}
      
    case .updateItems:
      state.items.removeAll()
      print("Removed all items")
      return .none
      
    default: return .none
    }
  }
)
  
struct ContentView: View {
  let store: Store<AppState, AppAction>
  
  var body: some View {
    NavigationView {
      WithViewStore(store) { store in
        LazyVStack(spacing: .zero) {
          ForEachStore(
            self.store.scope(state: { $0.items } , action: AppAction.item(id:action:)),
            content: ItemView.init(store:)
          )
          Spacer()
          NavigationLink(destination: OtherView()) {
            Text("Navigate")
          }
          Spacer()
          Button("Remove items") {
            NotificationCenter.default.post(name: Notification.Name("Testing"), object: nil)
          }
        }.onAppear{store.send(.onAppear)}
      }

    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(store: Store(
        initialState: AppState(items: []),
        reducer: appReducer,
        environment: appEnvironment
        )
      )
    }
}
