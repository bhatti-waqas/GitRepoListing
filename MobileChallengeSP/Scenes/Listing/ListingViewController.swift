//
//  ListingViewController.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 13.04.22.
//

import Foundation
import UIKit
import SkeletonView

final class ListingViewController: UIViewController {
    // MARK: - Private Properties
    private let viewModel: ListingViewModel
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Init
    init?(coder: NSCoder, viewModel: ListingViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        configureUI()
        viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.load()
    }
    
    private func configureUI() {
        self.title = viewModel.screenTitle
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
    private func reload() {
        Run.onMainThread {
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
        }
    }
}

// MARK: TableView DataSource
extension ListingViewController: SkeletonTableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListingTableViewCell = tableView.dequeue(for: indexPath)
        let viewModel = viewModel.row(at: indexPath.row)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "ListingTableViewCell"
    }
}

// MARK: TableView Delegate
extension ListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellDidSelect(at: indexPath)
    }
}

// MARK: ViewModel Delegates
extension ListingViewController: ListingViewModelDelegate {
    
    func onViewModelReady() {
        self.reload()
    }
    
    func onViewModelError(with error: Error) {
        viewModel.showErrorView()
    }
    
    func onViewModelNeedsUpdate(at indexPath: IndexPath) {
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
