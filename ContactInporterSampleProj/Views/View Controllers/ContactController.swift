//
//  ContactController.swift
//  ContactInporterSampleProj
//
//  Created by Ivan Ramirez on 4/18/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import Foundation

class ContactController {
    static let sharedInstance = ContactController()
    var contacts: [Contact] = []
    
    func createContact(firstName: String, lastName: String, jobTitle: String, organizationName: String, phoneNumber: String, emailAdress: String, postalAddres: String, birthDay: DateComponents?, thumbnailImageData: Data? ) {
        
        let newContact = Contact(firstName: firstName, lastName: lastName, jobTitle: jobTitle, organizationName: organizationName, phoneNumer: phoneNumber, emailAddres: emailAdress, postalAddres: postalAddres, birthday: birthDay, thumbnailImageData: thumbnailImageData)
        
        contacts.append(newContact)
        print("\nThe Number of contact records: \(contacts.count)\n")
        print(newContact.firstName)
        print(newContact.lastName)
        print(newContact.phoneNumer)
        print("\(String(describing: newContact.thumbnailImageData))")
        print(birthDay?.date?.asString)

    }
}
