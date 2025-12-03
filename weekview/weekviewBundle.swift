//
//  weekviewBundle.swift
//  weekview
//
//  Created by yilin on 2025/12/2.
//

import WidgetKit
import SwiftUI

@main
struct weekviewBundle: WidgetBundle {
    var body: some Widget {
        weekview()
        weekviewControl()
        weekviewLiveActivity()
    }
}
