import UIKit

class TableViewController: UITableViewController {
    
    let networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRefreshControl()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension TableViewController {
    private func downloadData() {
        networkManager.fetchUsers { [unowned self] result in
            switch result {
            case .success(let contacts):
                self.contacts = contacts
                tableView.reloadData()
                if refreshControl != nil {
                    refreshControl?.endRefreshing()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupRefreshControl() {
        //  Это свойство унаследовано от родительского класса, после чего инициализируем инициализатором по умолчанию
        refreshControl = UIRefreshControl()
        //  Добавляем надпись ниже элемента
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        //  Ниже старый способ, требует @objc
        //  refreshControl?.addTarget(self, action: #selector(downloadData), for: .valueChanged)
        //  Ниже новый способ
        let refreshAction = UIAction { [unowned self] _ in
            downloadData()
        }
        refreshControl?.addAction(refreshAction, for: .valueChanged)
    }
}
