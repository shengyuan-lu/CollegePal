//
//  AcknowledgementView.swift
//  
//
//  Created by Shengyuan Lu on 4/15/23.
//

import SwiftUI

struct AcknowledgementView: View {
    var body: some View {
        List {
            Section(header: Text("Public Domain Images")) {
                Text("All college images used by this Swift Playground App are from Wikipedia Commons under the Creative Commons License. Wikipedia Commons is a media file repository that is part of the Wikimedia Foundation. It provides a central repository for free-use images, sound, and other media files. Their website is https://commons.wikimedia.org. I do not own these images, and my usage comply with all applicable licensing terms and copyright obligations.")
                    .padding(.vertical, 8)
            }
            
            Section(header: Text("Public Domain Data")) {
                Text("All college data used by this Swift Playground App is from the Common Data Set (CDS). The CDS is a public domain resource. It is compiled and maintained by a group of higher education organizations. Their website is https://commondataset.org. I do not own this data set, and my usage comply with all applicable licensing terms and copyright obligations.")
                    .padding(.vertical, 8)
            }
            
            Section(header: Text("Open Source Code")) {
                Text("ConfettiSwiftUI, an open source Swift Package, is used in this Swift Playground App. Simon Bachmann authored this package. ConfettiSwiftUI is under MIT License. The source of this package is https://github.com/simibac/ConfettiSwiftUI. I do not own ConfettiSwiftUI, and my usage comply with all applicable licensing terms and copyright obligations.")
                    .padding(.vertical, 8)
            }
        }
        .navigationTitle("Acknowledgement")
    }
}

struct AcknowledgementView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementView()
    }
}
