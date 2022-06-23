//
//  ViewController.swift
//  PracticeFloatingActionButton
//
//  Created by Johnny Toda on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customTableView: UITableView! {
        didSet {
            customTableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        }
    }

    private let cellNibName = "CustomTableViewCell"
    private let cellID = "CellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate = self
        customTableView.dataSource = self
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        customTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustommTableViewCell
    }
}
