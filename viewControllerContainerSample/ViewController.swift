//
//  ViewController.swift
//  viewControllerContainerSample
//
//  Created by vincent on 2017/01/18.
//  Copyright © 2017年 vc7. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ContentAViewControllerDelegate, ContentBViewControllerDelegate {

    @IBOutlet weak var topViewContainer: UIView!
    @IBOutlet weak var bottomViewContainer: UIView!
    
    fileprivate var contentAViewController: ContentAViewController = ContentAViewController()
    fileprivate var contentBViewController: ContentBViewController = ContentBViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentAViewController.delegate = self
        self.contentBViewController.delegate = self
        
        // 抽出各自的 main view
        let contentAView = self.contentAViewController.view!
        let contentBView = self.contentBViewController.view!
        
        // 放入 top view container - A
        self.contentAViewController.willMove(toParentViewController: self)
        self.topViewContainer.addSubview(contentAView)
        // Layout, 加入 constraints - A
        contentAView.translatesAutoresizingMaskIntoConstraints = false
        self.topViewContainer.addConstraints([
            NSLayoutConstraint(item: contentAView, attribute: .top, relatedBy: .equal, toItem: self.topViewContainer, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAView, attribute: .bottom, relatedBy: .equal, toItem: self.topViewContainer, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAView, attribute: .leading, relatedBy: .equal, toItem: self.topViewContainer, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentAView, attribute: .trailing, relatedBy: .equal, toItem: self.topViewContainer, attribute: .trailing, multiplier: 1, constant: 0),
            ])
        
        // 放入 bottom view container - B
        self.contentBViewController.willMove(toParentViewController: self)
        self.bottomViewContainer.addSubview(contentBView)
        // Layout, 加入 constraints - B
        contentBView.translatesAutoresizingMaskIntoConstraints = false
        self.bottomViewContainer.addConstraints([
            NSLayoutConstraint(item: contentBView, attribute: .top, relatedBy: .equal, toItem: self.bottomViewContainer, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentBView, attribute: .bottom, relatedBy: .equal, toItem: self.bottomViewContainer, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentBView, attribute: .leading, relatedBy: .equal, toItem: self.bottomViewContainer, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: contentBView, attribute: .trailing, relatedBy: .equal, toItem: self.bottomViewContainer, attribute: .trailing, multiplier: 1, constant: 0),
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - ContentAViewControllerDelegate
    
    func contentAViewController(viewController: ContentAViewController, didSelectAtRow row: Int) {
        debugPrint("Selecting A at row - \(row)")
    }
    
    // MARK: - ContentBViewControllerDelegate
    
    func contentBViewController(viewController: ContentBViewController, didSelectAtRow row: Int) {
        debugPrint("Selecting B at row - \(row)")
    }

}

