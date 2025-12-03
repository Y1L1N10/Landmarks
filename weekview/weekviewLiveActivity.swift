//
//  weekviewLiveActivity.swift
//  weekview
//
//  Created by yilin on 2025/12/2.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct weekviewAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct weekviewLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: weekviewAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension weekviewAttributes {
    fileprivate static var preview: weekviewAttributes {
        weekviewAttributes(name: "World")
    }
}

extension weekviewAttributes.ContentState {
    fileprivate static var smiley: weekviewAttributes.ContentState {
        weekviewAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: weekviewAttributes.ContentState {
         weekviewAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: weekviewAttributes.preview) {
   weekviewLiveActivity()
} contentStates: {
    weekviewAttributes.ContentState.smiley
    weekviewAttributes.ContentState.starEyes
}
