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
            Section(header: Text("Image Source")) {
                Text("All college images used by this Swift Playground App are from Wikipedia Commons under the Creative Commons License. Wikipedia Commons is a media file repository that is part of the Wikimedia Foundation. It provides a central repository for free-use images, sound, and other media files. Their website is https://commons.wikimedia.org.")
            }
            
            Section(header: Text("Data Source")) {
                Text("All college data used by this Swift Playground App is from the Common Data Set (CDS). The CDS is a public domain resource. It is compiled and maintained by a group of higher education organizations. Their website is https://commondataset.org.")
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
