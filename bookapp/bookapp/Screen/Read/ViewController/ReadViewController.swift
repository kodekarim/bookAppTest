//
//  ReadViewController.swift
//  bookapp
//
//  Created by abdul karim on 18/08/23.
//

import UIKit

class ReadViewController: UIPageViewController {
    
    var pageControl = UIPageControl()
    var viewModel:ReadViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        viewModel.setup()
        if let firstPage = viewModel.pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        setupPageControl()

    }
    
    func setupPageControl() {
        pageControl.numberOfPages = viewModel.pages.count
        pageControl.backgroundStyle = .prominent
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }

}

extension ReadViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewModel.pages.firstIndex(of: viewController), index > 0 else {
            return nil
        }

        return viewModel.pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewModel.pages.firstIndex(of: viewController), index < viewModel.pages.count - 1 else {
            return nil
        }

        return viewModel.pages[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let currentPage = viewControllers?.first, let index = viewModel.pages.firstIndex(of: currentPage) {
            pageControl.currentPage = index
        }
    }
    
}

extension ReadViewController : EditViewDelegate {
    func handleFontSize(stepper: UIStepper) {
        UserSettings.fontSize = stepper.value
        let index = pageControl.currentPage
        if let viewController = viewModel.pages[index] as? SingleViewController {
            viewController.refreshUI()
        }
    }
    
    func hanleLineSpace(stepper: UIStepper) {
        UserSettings.lineSpace = stepper.value
        let index = pageControl.currentPage
        if let viewController = viewModel.pages[index] as? SingleViewController {
            viewController.refreshUI()
        }
    }
    
}

extension ReadViewController : ViewFromNib {}
