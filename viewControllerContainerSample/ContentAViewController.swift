//
//  ContentAViewController.swift
//  viewControllerContainerSample
//
//  Created by vincent on 2017/01/18.
//  Copyright © 2017年 vc7. All rights reserved.
//

import UIKit

fileprivate let kContentACellIdentifier = "ContentACellIdentifier"

protocol ContentAViewControllerDelegate: NSObjectProtocol {
    
    /// 選取第幾行
    func contentAViewController(viewController: ContentAViewController, didSelectAtRow: Int);
}

class ContentAViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    weak var delegate: ContentAViewControllerDelegate?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kContentACellIdentifier)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kContentACellIdentifier, for: indexPath) 
        
        cell.textLabel?.text = "current row: (A)\(indexPath.row)"
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.contentAViewController(viewController: self, didSelectAtRow: indexPath.row)
    }
    
}
