


import SwiftUI
import Foundation


struct SDImage: View {
    
    let object: [String: Any]
    
    init(_ object: [String: Any]) {
        self.object = object
    }
    
    var name: String? {
        object["name"] as? String
    }
    
    var systemName: String? {
        object["system_name"] as? String
    }
    
    var view: some View {
        if let name = name {
            return Image(uiImage: #imageLiteral(resourceName: name))
        }
        if let systemName = systemName {
            return Image(systemName: systemName)
        }
        return Text("Missing Image name")
    }
    
    var body: some View {
        view
    }
}


