//
//  ContactTVC.swift
//  ContactInporterSampleProj
//
//  Created by Ivan Ramirez on 4/18/19.
//  Copyright © 2019 ramcomw. All rights reserved.
//

import UIKit
import ContactsUI

class ContactTVC: UITableViewController,  CNContactPickerDelegate {

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

 
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tyndale Apps"
    }
    
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return ["Tyndale Contacts"]
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ContactController.sharedInstance.contacts.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.contactCell, for: indexPath)
            
            as? ContactTVCell else {
            return UITableViewCell()
        }
        
        let contactRow = ContactController.sharedInstance.contacts[indexPath.row]
        

        cell.contact = contactRow
        
//        cell.textLabel?.text = contactRow.firstName
//        cell.detailTextLabel?.text = contactRow.lastName
//
   
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        showContcts()
    }
    
    func showContcts() {
        let picker = CNContactPickerViewController()
        picker.delegate = self
        
        picker.predicateForEnablingContact = NSPredicate(format: "emailAddresses.@count > 0")
//
//        picker.predicateForSelectionOfContact = NSPredicate(format: "emailAddresses.@count == 1")
        
        present(picker, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        for data in contact.phoneNumbers {
            let phoneNumber = data.value
            
//            sponsorsPhoneNumberTextField.text = phoneNumber.stringValue
        }
        
        for postalAddressDate in contact.postalAddresses {
            let postalAddress = postalAddressDate.value
        }
        
        let firstName = contact.givenName
        let lastName = contact.familyName
        let jobTitle = contact.jobTitle
        let organizationName = contact.organizationName
        let birthDay = contact.birthday
        let thumbnailImageData = contact.thumbnailImageData
        let email = contact.emailAddresses.first
        //grab the value of that email property
        let emailString = email?.value
        
        ContactController.sharedInstance.createContact(firstName: firstName, lastName: lastName, jobTitle: jobTitle, organizationName: organizationName, phoneNumber: "717-000-0010", emailAdress: "\(emailString ?? "No Email Found")", postalAddres: "1234 Street", birthDay: birthDay, thumbnailImageData: thumbnailImageData)
        
            
            self.tableView.reloadData()
        
    }
}
