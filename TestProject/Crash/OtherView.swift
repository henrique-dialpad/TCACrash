//
//  OtherView.swift
//  TestProject
//
//  Created by Henrique Forioni de Lima on 03/03/21.
//

import SwiftUI

struct OtherView: View {
  var body: some View {
    Button("Send notification to remove items") {
      NotificationCenter.default.post(name: Notification.Name("Testing"), object: nil)
    }
  }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
      OtherView()
    }
}
