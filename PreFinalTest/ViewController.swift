//
//  ViewController.swift
//  PreFinalTest
//
//  Created by Pavel Sipigin on 5/8/18.
//  Copyright © 2018 Pavel Sipigin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    var tableViewData = [["coverIcon":"uroboros", "title":"Ouroboros Pt. I: Street 36", "year":"2017", "artist":"Scriptonite", "genre":"Hip-hop/Rap"],
        ["coverIcon":"myDearMelancholy", "title":"My Dear Melancholy", "year":"2018", "artist":"Weeknd", "genre":"Hip-hop/Rap"],
        ["coverIcon":"americanBeautyAmericanPsycho", "title":"American Beauty/American Psycho", "year":"2015", "artist":"Fall Out Boy", "genre":"Alternative"],
        ["coverIcon":"tranquilityBaseHotelCasino", "title":"Tranquility Base Hotel & Casino", "year":"2018", "artist":"Arctic Monkeys", "genre":"Indie Rock"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func textDidChange(_ notification: Notification) {
        print("Its come here textDidChange")
        //guard (notification.object as? NSTextView) != nil else { return }
        //let numberOfCharatersInTextfield = searchField.stringValue
        //lprint("numberOfCharatersInTextfield = \(numberOfCharatersInTextfield)")
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        if tableView.selectedRow > -1 {
            tableViewData.remove(at: tableView.selectedRow)
            tableView.removeRows(at: [tableView.selectedRow], withAnimation: NSTableView.AnimationOptions.effectFade)
        }
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        tableViewData.append(["coverIcon":"NSTouchBarFolderMoveToTemplate", "title":"Album Title", "year":"Year", "artist":"Artist", "genre":"Genre"])
        tableView.insertRows(at: [tableViewData.count - 1], withAnimation: .effectFade)
    }
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result: MainTableCellView = tableView.make(withIdentifier: "defaultRow", owner: self) as! MainTableCellView
        result.posterView.image = NSImage(named: tableViewData[row]["coverIcon"]!)
        result.titleTextField.stringValue = tableViewData[row]["title"]!
        result.yearTextField.stringValue = tableViewData[row]["year"]!
        result.artistTextField.stringValue = tableViewData[row]["artist"]!
        result.genreTextField.stringValue = tableViewData[row]["genre"]!
        
        return result
    }
}
