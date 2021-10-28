//
//  ViewController.swift
//  practice12
//
//  Created by Sakai Syunya on 2021/10/28.
//  Copyright © 2021 Sakai Syunya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var scrollViewDefaultWidth: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        scrollViewDefaultWidth = scrollView.frame.size.width
        
        let imageView1 = createImageView(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "images1")
        scrollView.addSubview(imageView1)
        
        let imageView2 = createImageView(x: scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "images2")
        scrollView.addSubview(imageView2)
        
        let imageView3 = createImageView(x: scrollView.frame.size.width*2, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "images3")
        scrollView.addSubview(imageView3)
        
        let imageView4 = createImageView(x: scrollView.frame.size.width*3, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height, image: "images4")
        scrollView.addSubview(imageView4)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width*4, height: scrollView.frame.size.height)

    }
    
    func createImageView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, image: String) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        let image = UIImage(named: image)
        imageView.image = image
        
        return imageView
    }
       
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
    
    @IBAction func tapPageControl(_ sender: Any) {
        guard let width = scrollViewDefaultWidth else { return }
        
        scrollView.contentOffset.x = CGFloat(width * CGFloat(pageControl.currentPage))
    }
    
}

