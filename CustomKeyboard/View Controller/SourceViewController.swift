//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by gopinath.a on 13/03/20.
//  Copyright © 2020 Innoplexus. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {

    //MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    let viewModel:SourceViewModel = SourceViewModelImpl()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//MARK: - Tableview Extension
extension SourceViewController: UITableViewDataSource, UITableViewDelegate{
    
    //MARK: DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNames().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.getNames()[indexPath.row]
        return cell
    }
    
    //MARK: Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

