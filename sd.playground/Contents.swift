

import SwiftUI
import PlaygroundSupport

let sections = [
    [
        "name": "Common forms",
        "items": [
            "Authorization form",
            "Change form"
        ]
    ],
    [
        "name": "CVS",
        "items": [
            "Other Insurance/Coordination of Benefits (COB)",
            "Prescription For Controlled Substance Form"
        ]
     ],
     [
        "name": "IBX",
        "items": [
           "Individual Request For Accounting (HIPPA)"
        ]
     ],
     [
        "name": "UCD",
        "items": [
           "Other Insurance/Coordination of Benefits (COB)"
       ]
     ]
]

struct MembersFormsView: View {
    
    var sections: [[String: Any]]
    
    init(_ sections: [[String: Any]]) {
        self.sections = sections
    }
    
    func items(section: Int) -> [String] {
        return sections[section]["items"] as! [String]
    }
    
    func countItems(section: Int) -> Int {
        return (sections[section]["items"] as! [String]).count
    }
    
    func isLastItem(section: Int, index: Int) -> Bool {
        return index < countItems(section: section) - 1
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(0..<sections.count) { section in
                    Text(sections[section]["name"] as! String)
                        .font(.title3)
                        .fontWeight(.heavy)
                    VStack(alignment: .leading) {
                        ForEach(0..<countItems(section: section)) { index in
                            HStack(alignment: .center, spacing: 0) {
                                ForEach(0..<1) { index in
                                    Text(items(section: section)[index])
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: 100_000, alignment: .leading)
                                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                                    #imageLiteral(resourceName: "pin.png")
                                    Image(uiImage: #imageLiteral(resourceName: "pin.png"))
                                        .frame(width: 20, height: 20, alignment: .center)
                                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                                }
                            }
                            if isLastItem(section: section, index: index) {
                                Divider()
                            }
                        }
                    }#imageLiteral(resourceName: "pin.png"
                    .overlay(RoundedRectangle(cornerRadius: 8.0)
                        .stroke(lineWidth: 0.25)
                    )
                }
            }.padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        }
    }
}


PlaygroundPage.current.setLiveView(
    MembersFormsView(sections)
        .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
)


//var object: [String: Any] = [
//    "__typename": "stack",
//    "direction": "vertical",
//    "alignment": "leading",
//    "spacing": 24.0,
//    "frame": [
//        "width": 500.0,
//        "height": 1000.0
//    ],
//    "objects": sections.reduce([], { sections, section in
//        sections + [
//            [
//                "__typename": "text",
//                "text": section["name"],
//                "font": "title3",
//                "weight": "heavy",
//            ],
//            [
//                "__typename": "stack",
//                "direction": "vertical",
//                "alignment": "leading",
//                "corner_radius": 8.0,
//                "border": [
//                    "color": [
//                        "name": "gray",
//                    ],
//                    "width": 1.0,
//                ],
//                "objects": (section["items"] as! [String]).reduce([], { items, item in
//                    items + [
//                        [
//                            "__typename": "stack",
//                            "direction": "horizontal",
//                            "objects": [
//                                [
//                                    "__typename": "text",
//                                    "text": item,
//                                    "font": "title3",
//                                    "weight": "medium",
//                                    "alignment": "leading",
//                                    "frame": [
//                                        "max_width": 10000.0,
//                                        "alignment": "leading"
//                                    ],
//                                    "padding": [
//                                        "all": 16.0,
//                                    ],
//                                ],
//                                [
//                                    "__typename": "image",
//                                    "system_name": "arrow.right",
//                                    "padding": [
//                                        "all": 16.0,
//                                    ],
//                                    "frame": [
//                                        "width": 20.0,
//                                        "height": 20.0,
//                                    ]
//                                ],
//                            ]
//                        ],
//                        [
//                            "__typename": "divider",
//                        ]
//                    ]
//                })
//            ]
//        ]
//    })
//]
//
//let view = SDView(object)
//PlaygroundPage.current.setLiveView(
//    view
//        .preferredColorScheme(.dark)
//        .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
//)

//if let pathJson = Bundle.main.path(forResource: "card4", ofType: "json"), let dataJson = FileManager.default.contents(atPath: pathJson) {
//    do {
//        let object = try JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions.json5Allowed) as! [String : Any]
//        print(type(of: object))
//        let view = SDView(object)
//        PlaygroundPage.current.setLiveView(
//            view
//                .preferredColorScheme(.dark)
//                .padding(EdgeInsets(top: 50, leading: 50, bottom: 50, trailing: 50))
//        )
//    }
//}

