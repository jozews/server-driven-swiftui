


import SwiftUI
import Foundation


struct SDFrame: View {
    
    let object: [String: Any]
    let view: any View

    init(_ object: [String: Any], _ view: any View) {
        self.object = object
        self.view = view
    }
    
    var width: Double? {
        object["width"] as? Double
    }
    
    var height: Double? {
        object["height"] as? Double
    }
    
    var minWidth: Double? {
        object["min_width"] as? Double
    }
    
    var idealWidth: Double? {
        object["idea_width"] as? Double
    }
    
    var maxWidth: Double? {
        object["max_width"] as? Double
    }
    
    var minHeight: Double? {
        object["min_height"] as? Double
    }
    
    var idealHeight: Double? {
        object["ideal_height"] as? Double
    }
    
    var maxHeight: Double? {
        object["max_height"] as? Double
    }
    
    var alignmentName: String? {
        object["alignment"] as? String
    }
    
    var alignment: Alignment {
        if let name = alignmentName {
            if name == "top_leading" {
                return .topLeading
            }
            if name == "top" {
                return .top
            }
            if name == "top_trailing" {
                return .topTrailing
            }
            if name == "leading" {
                return .leading
            }
            if name == "center" {
                return .center
            }
            if name == "trailing" {
                return .trailing
            }
            if name == "bottom_leading" {
                return .bottomLeading
            }
            if name == "bottom" {
                return .bottom
            }
            if name == "bottom_trailing" {
                return .bottomTrailing
            }
        }
    
        return .center
    }
    
    var body: some View {
        if width != nil || height != nil {
            return view
                .frame(width: width != nil ? CGFloat(width!) : nil, height: height != nil ? CGFloat(height!) : nil, alignment: alignment)

        }
        return view
            .frame(minWidth: minWidth != nil ? CGFloat(minWidth!) : nil, idealWidth: idealWidth != nil ? CGFloat(idealWidth!) : nil, maxWidth: maxWidth != nil ? CGFloat(maxWidth!) : nil, minHeight: minHeight != nil ? CGFloat(minHeight!) : nil, idealHeight: idealHeight != nil ? CGFloat(idealHeight!) : nil, maxHeight: maxHeight != nil ? CGFloat(maxHeight!) : nil, alignment: alignment)
    }
}

