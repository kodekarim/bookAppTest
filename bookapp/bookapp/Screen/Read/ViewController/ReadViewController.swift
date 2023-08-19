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
    var currentVC:SingleViewController?
    var fontz:UIFont?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        viewModel.setup()
        if let firstPage = viewModel.pages.first {
            currentVC = firstPage as? SingleViewController
            setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }
        setupPageControl()
        
        fontz = viewModel.preferredFontWithCustomSize(for: .body, customSize: 14)
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
        currentVC = viewController as? SingleViewController
        currentVC?.refreshUI(fontSize: viewModel.customFontSize)
        return viewModel.pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewModel.pages.firstIndex(of: viewController), index < viewModel.pages.count - 1 else {
            return nil
        }
        
        currentVC?.refreshUI(fontSize: viewModel.customFontSize)
        currentVC = viewController as? SingleViewController
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
        viewModel.customFontSize = stepper.value
        if let vc = currentVC {
            vc.refreshUI(fontSize: viewModel.customFontSize)
        }
    }
    
    func hanleLineSpace(stepper: UIStepper) {
        if let vc = currentVC  {
            
            let attributedString = NSMutableAttributedString(string: vc.lContentLabel.text ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = stepper.value
            
            attributedString.addAttribute(
                        .paragraphStyle,
                        value: paragraphStyle,
                        range: NSRange(location: 0, length: attributedString.length
                    ))
            
            vc.lContentLabel.attributedText = attributedString
        }
    }
    
    
}

extension ReadViewController : ViewFromNib {}
