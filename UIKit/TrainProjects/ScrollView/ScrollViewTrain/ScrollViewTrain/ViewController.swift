//
//  ViewController.swift
//  ScrollViewTrain
//
//  Created by Кащенко on 29.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    private var scrollView = UIScrollView() {
        didSet {
            scrollView.delegate = self
        }
    }
    
    private var zoomingImageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        fetchImage()
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        // Do any additional setup after loading the view.
    }
    
    
    private func fetchImage() {
        guard let image = UIImage(named: "iphone") else {
            return
        }
        
        let imageView = UIImageView(image: image)
        scrollView.addSubview(imageView)
        scrollView.contentSize = image.size
        scrollView.minimumZoomScale = 0.01
        scrollView.maximumZoomScale = 2
        zoomingImageView = imageView

    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroll hapend")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        zoomingImageView
    }
}
