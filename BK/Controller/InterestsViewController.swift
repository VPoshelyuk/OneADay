//
//  File.swift
//  BK
//
//  Created by Slava Pashaliuk on 3/22/20.
//  Copyright © 2020 Viachaslau Pashaliuk. All rights reserved.
//

import Foundation
import UIKit

class InterestsViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func backDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    var thingsToDo: [String] = []
    var genres: [String] = ["Action", "Adventure", "Comedy", "Crime", "Drama", "Fantasy", "Historical", "Horror", "Mystery", "Political", "Romance", "Science fiction", "Social", "Thriller", "Urban", "Western"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        
        navBar.shadowImage = UIImage()
        
        let pCount = thingsToDo.contains("Movies") && thingsToDo.contains("TV") ? thingsToDo.count - 1 : thingsToDo.count
        genres.shuffle()
        for i in 0..<pCount {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            let pickView = UIView(frame: frame)
            for j in 0..<genres.count {
                let button = UIButton(type: UIButton.ButtonType.system)
                button.frame = CGRect(x: Int(view.frame.size.width)/4 * (j%4) + Int.random(in: 1...10), y: Int(scrollView.frame.size.height)/4 * Int(j/4) + Int.random(in: 1...40), width: 80, height: 80)
                button.setBackgroundImage(UIImage(named: "selectionBubble"), for: UIControl.State.normal)
                button.addTarget(self, action: #selector(buttonAction), for: UIControl.Event.touchUpInside)
                button.setTitle(genres[j], for: UIControl.State.normal)
                button.setTitleColor(UIColor.red, for: UIControl.State.normal)
                button.titleLabel?.font = .systemFont(ofSize: 20)
//                    UIFont(name: YourfontName, size: 20)
                button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
                pickView.addSubview(button)
            }
//            imgView.image = UIImage(named: "SignUp")
            self.scrollView.addSubview(pickView)
        }
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(pCount)), height: (scrollView.frame.size.height))
        scrollView.delegate = self
    }
    
    @objc func buttonAction(sender: UIButton) {
        let newSize = CGFloat(sender.frame.size.width * 1.1)
        sender.frame = CGRect(x: sender.frame.minX, y: sender.frame.minY, width: newSize, height: newSize)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}
