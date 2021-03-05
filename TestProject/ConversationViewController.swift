////
////  ConversationViewController.swift
////  TestProject
////
////  Created by Henrique Forioni de Lima on 04/03/21.
////
//
//import Foundation
//import SwiftUI
//import ComposableArchitecture
//
//class NewConversationHostingController: UIHostingController<ContentView> {
//  let items: [ItemState] = [.init(id: UUID(),
//                                  text: "oi1"),
//                            .init(id: UUID(),
//                                  text: "oi2"),
//                            .init(id: UUID(),
//                                  text: "oi3"),
//                            .init(id: UUID(),
//                                  text: "oi4")]
//  
//  init() {
//    super.init(rootView: ContentView(store: Store(
//      initialState: AppState(items: items),
//      reducer: appReducer,
//      environment: ()
//    ))
//    )
//  }
//  
//  @objc required dynamic init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
//
//class OtherViewHostingController: UIHostingController<OtherView> {
//  init() {
//    super.init(rootView: OtherView())
//  }
//  
//  @objc required dynamic init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//}
