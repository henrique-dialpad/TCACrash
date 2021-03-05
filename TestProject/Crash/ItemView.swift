//
//  ItemView.swift
//  TestProject
//
//  Created by Henrique Forioni de Lima on 03/03/21.
//

import SwiftUI
import ComposableArchitecture

struct ItemState: Identifiable, Equatable {
  var id: Int
  var text: String
}

enum ItemAction: Equatable {
  case onAppear
}

let itemReducer = Reducer<ItemState, ItemAction, Void> { state, action, environment in
  switch action {
  case .onAppear:
    print("\(state.text) appeared")
    return .none
  }
}

struct ItemView: View {
  let store: Store<ItemState, ItemAction>
  
  var body: some View {
    WithViewStore(store) { store in
      Text(store.text)
        .onAppear { store.send(.onAppear) }
    }
  }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
      ItemView(store: .init(initialState: ItemState(id: 1, text: "oi"), reducer: itemReducer, environment: ()))
    }
}
