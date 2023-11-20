//
//  ViewController.swift
//  StretchingPicture
//
//  Created by Artyom on 19.11.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = UIScrollView(frame: view.bounds)
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)

        let image = UIImage(named: "snailGeri")
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 270)
        scrollView.addSubview(imageView)

        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + imageView.frame.height)
        
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        if yOffset < 0 {
            imageView.frame.origin.y = yOffset
            imageView.frame.size.height = 270 - yOffset
            scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 270 - yOffset, left: 0, bottom: 0, right: 0)
        } else {
            imageView.frame.origin.y = -yOffset
        }
    }
}
