//
//  ViewController.swift
//  PracticeFloatingActionButton
//
//  Created by Johnny Toda on 2022/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var customTableView: UITableView! {
        didSet {
            customTableView.delegate = self
            customTableView.dataSource = self
            customTableView.register(UINib(nibName: cellNibName, bundle: nil), forCellReuseIdentifier: cellID)
        }
    }

    // 画面右下に表示させるボタンを生成
    @IBOutlet private weak var floatingActionButton: UIButton!

    private let cellNibName = "CustomTableViewCell"
    private let cellID = "CellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpfloatingActionButtonSize()
    }

    private func setUpfloatingActionButtonSize() {
        // ボタンの幅と高さを指定
        let width = UIScreen.main.bounds.width / 5
        let height = width
        floatingActionButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        floatingActionButton.heightAnchor.constraint(equalToConstant: height).isActive = true

        // ボタンを円形に変更
        floatingActionButton.layer.cornerRadius = width / 2
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        customTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustommTableViewCell
    }
}
