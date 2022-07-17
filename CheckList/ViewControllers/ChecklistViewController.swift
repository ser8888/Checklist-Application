//
//  ViewController.swift
//  Checklist
//
//  Created by Sergejs Tiselskis on 16/07/2022.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item1 = ChecklistItem()
        item1.text = "First raw"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Second raw"
        item2.checked = true
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Third raw"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Forth raw"
        item4.checked = true
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Fifth raw"
        item5.checked = true
        items.append(item5)
        
    }
    //MARK: - Actions
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        print("newRowIndex=\(newRowIndex)")
        let item = ChecklistItem()
        item.text = "Я новая строка"
        item.checked = true
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        print("indexPath=\(indexPath)")
        let indexPaths = [indexPath]
        print("indexPaths=\(indexPaths)")
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
//TODO: - определяем количксвто строк
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
        }





 //FIXME: - delegate methods, gets called whenever user taps a cell
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
        
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    private func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    private func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
}
