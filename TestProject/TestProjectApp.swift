//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Henrique Forioni de Lima on 03/03/21.
//

import SwiftUI
import ComposableArchitecture

let items: IdentifiedArrayOf<ItemState> = [
  .init(id: 1, text: "Item 1"),
  .init(id: 2, text: "Item 2"),
  .init(id: 3, text: "Item 3"),
  .init(id: 4, text: "Item 4")
]

@main
struct TestProjectApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(store: Store(
            initialState: AppState(items: items),
            reducer: appReducer,
            environment: appEnvironment
            )
          )
        }
    }
}
