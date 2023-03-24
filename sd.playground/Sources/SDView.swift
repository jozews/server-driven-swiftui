


import SwiftUI
import Foundation


public struct SDView: View {
    
    let object: [String: Any]
    
    public init(_ object: [String: Any]) {
        self.object = object
    }
    
    var type: String {
        object["__typename"] as! String
    }
    
    public var padding: [String : Any]? {
        object["padding"] as? [String : Any]
    }

    var color: [String: Double]? {
        object["color"] as? [String : Double]
    }
    
    var cornerRadius: Double {
        object["corner_radius"] as? Double ?? 0
    }
    
    var frame: [String: Any]? {
        object["frame"] as? [String: Any]
    }
    
    var border: [String: Any]? {
        object["border"] as? [String: Any]
    }
    
    var borderColor: [String: Any]? {
        border?["color"] as? [String: Any]
    }
    
    var borderWidth: Double {
        border?["width"] as? Double ?? 0
    }
    
    var view: some View {
        
        let view: any View
        
        if type == "stack" {
            view = StackSD(object)
        }
        
//        if type == "grid" {
//            return SDGrid(object)
//        }
        
        else if type == "async_image" {
            view = SDAsyncImage(object)
        }
        
        else if type == "image" {
            view = SDImage(object)
        }
        
        else if type == "link" {
            view = SDLink(object)
        }
        
        else if type == "text" {
            view = SDText(object)
        }
        
        else if type == "divider" {
            view = SDDivider(object)
        }
        
        else {
            view = Text("Unknown __typename")
        }

        if let frame = frame {
            return SDFrame(frame, view)
        }
        
        return view
    }
    
    var viewFramed: some View {
        if let frame = frame {
            return SDFrame(frame, view)
        }
        return view
    }
    
    public var body: some View {
        viewFramed
            .foregroundColor(SDColor(color).color)
            .padding(SDPadding(padding).insets)
            .border(SDColor(borderColor).color, width: borderWidth)
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(SDColor(borderColor).color, lineWidth: borderWidth)
            )
    }
}


