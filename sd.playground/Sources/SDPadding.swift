


import SwiftUI
import Foundation


public struct SDPadding {
    
    public let object: [String: Any]?
    
    public init(_ object: [String: Any]?) {
        self.object = object
    }
    
    public var all: Double? {
        object?["all"] as? Double
    }

    var top: Double {
        object?["top"] as? Double ?? 0
    }
    
    var leading: Double {
        object?["leading"] as? Double ?? 0
    }
    
    var bottom: Double {
        object?["bottom"] as? Double ?? 0
    }
    
    var trailing: Double {
        object?["trailing"] as? Double ?? 0
    }
    
    public var insets: EdgeInsets {
        if let all = all {
            return EdgeInsets(top: all, leading: all, bottom: all, trailing: all)
        }
        return EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}

