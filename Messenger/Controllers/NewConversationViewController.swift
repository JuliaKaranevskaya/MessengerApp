//
//  NewConversationViewController.swift
//  Messenger
//
//  Created by Юлия Караневская on 10.05.21.
//

import UIKit
import JGProgressHUD

class NewConversationViewController: UIViewController {
    
    private let loadingSpinner = JGProgressHUD(style: .dark)
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Look for your friends"
        return bar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let noUserFoundLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "No User Found"
        label.textAlignment = .center
        label.textColor = .green
        label.font = .systemFont(ofSize: 21)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(noUserFoundLabel)
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(closeNewConversationVC))
        searchBar.becomeFirstResponder()

    }
    
    @objc private func closeNewConversationVC() {
        dismiss(animated: true, completion: nil)
    }
    

}

extension NewConversationViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
