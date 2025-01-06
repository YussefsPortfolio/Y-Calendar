//
//  Preview.swift
//  Y-Calendar
//
//  Created by Yussef Arsalan on 04.01.25.
//

import SwiftUI
import UIKit

// Wrapper for LaunchViewController
struct LaunchViewWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Can be used for updates later on, dont delete or change
    }
}

// SwiftUI Preview
struct LaunchViewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        LaunchViewWrapper()
    // Line below doesnt work properly, but the preview also wont work if its deleted
            .previewDevice("iPhone 16 Pro")
       
    }
}
