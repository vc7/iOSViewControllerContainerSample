//
//  ContentBViewController.swift
//  viewControllerContainerSample
//
//  Created by vincent on 2017/01/18.
//  Copyright © 2017年 vc7. All rights reserved.
//

import UIKit

fileprivate let kContentBCellIdentifier = "ContentBCellIdentifier"

protocol ContentBViewControllerDelegate: NSObjectProtocol {
    
    /// 選取第幾行
    func contentBViewController(viewController: ContentBViewController, didSelectAtRow row: Int);
}

class ContentBViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: ContentBViewControllerDelegate?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kContentBCellIdentifier)
        
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
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kContentBCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "current row: (B) \(indexPath.row)"
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.contentBViewController(viewController: self, didSelectAtRow: indexPath.row)
    }
    
}
