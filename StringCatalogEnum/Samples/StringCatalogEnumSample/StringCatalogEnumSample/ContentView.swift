//
//  ContentView.swift
//  StringCatalogEnumSample
//  This class provides basic content view to test the XCS string functions
//
//  Created by Yuxuan Li on 3/19/24.
//

import SwiftUI

/**
 To use XString Catalog Enum
 Define the key and content within Localizable.xcstrings(This could be any name you want)
 Then clone the repo and make release the dirctore "StringCatalogEnum"
 Once make release is succedd
 "Use./xcstrings-enum-generate --xcstrings-path /Path/To/(This could use any name you want)Localizable.xcstrings --output-filename /Path/to/GeneratedStrings.swift(This name could be any name you want)
 It will automatically generated an swift file and put it into the project directory
 */
//Basic Usage

struct ContentView: View {
    
    //example variable
    let userName = "Alice"
    //This could be changed
    let itemCount = 3
    
    var welcomeMessage:String {
        String(format: NSLocalizedString("WelcomeMessageFormat", comment: "Welcome message with user name on it"), userName)
    }
    
    var itemMessage: String {
            itemCount == 1 ?
                NSLocalizedString("SingleItemMessage", comment: "Message for a single item") :
                String(format: NSLocalizedString("MultipleItemsMessage", comment: "Message format for multiple items"), itemCount)
        }
    
    
    var body: some View {
        VStack(spacing:20) {
            
            Text(welcomeMessage)
            Text(itemMessage)
            
            //This content is defined within Localizable.xcstrins.
            Text(XCS.welcomeBackKey.key)
            Text(XCS.testingKey.key)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
