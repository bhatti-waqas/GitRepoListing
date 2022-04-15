//
//  ListingViewModel.swift
//  MobileChallengeSP
//
//  Created by Waqas Naseem on 14.4.22
//

import Utilities
import Foundation

final class ListingViewModel {
    
    public weak var delegate: ListingViewModelDelegate?
    let screenTitle = "Trending"
    private let listingUseCase: ListingUseCase
    private unowned let navigator: ListingNavigator
    private var listingRowViewModels: [ListingRowViewModel] = []
    
    init(with useCase: ListingUseCase, navigator: ListingNavigator) {
        self.listingUseCase = useCase
        self.navigator = navigator
    }
    
    // MARK: - Public methods
    public func load() {
        listingUseCase.fetchListings(then: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case.success(let listings):
                let listingRows = listings.map(self.makeListingRowViewModel(with:))
                self.listingRowViewModels = listingRows
                self.makeReady()
            case .failure(let error):
                self.throwError(with: error)
            }
        })
    }
        
    public func makeReady() {
        self.delegate?.onViewModelReady()
    }
    
    public func numberOfRows() -> Int {
        return listingRowViewModels.count
    }
    
    public func numberOfSections() -> Int {
        return 1
    }
    
    public func row(at index: Int) -> ListingRowViewModel {
        listingRowViewModels[index]
    }
    
    func cellDidSelect(at indexPath: IndexPath) {
        let listRowViewModel = listingRowViewModels[indexPath.row]
        listRowViewModel.toggleRowState()
        self.delegate?.onViewModelNeedsUpdate(at: indexPath)
    }
    
    public func throwError(with error: Error) {
        // In some cases we are receiving errors from background threads.
        // We need to make sure we use main thread since we are going to interact with UI
        Run.onMainThread {
            self.delegate?.onViewModelError(with: error)
        }
    }
    
    public func showErrorView() {
        navigator.showErrorState()
    }
    
    // MARK: - Private methods
    private func makeListingRowViewModel(with repository: Repository) -> ListingRowViewModel {
        .init(with: repository.id, nodeId: repository.nodeId, name: repository.name,
              score: repository.score, isPrivate: repository.isPrivate, owner: repository.owner)
    }
}
