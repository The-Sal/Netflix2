//
//  extensions.swift
//  Netflix2
//
//  Created by Sal Faris on 31/01/2022.
//

import Foundation
import SwiftUI

extension NSTableView {
  open override func viewDidMoveToWindow() {
    super.viewDidMoveToWindow()

    backgroundColor = NSColor.clear
      if enclosingScrollView != nil{
          enclosingScrollView!.drawsBackground = false
      }
  }
}
