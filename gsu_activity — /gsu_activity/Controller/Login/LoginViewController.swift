//
//  LoginViewController.swift
//  gsu_activity
//
//  Created by юра шинкар on 9.01.23.
//

import UIKit

protocol LoginViewControllerDelegate {
    func openRegVC()
    func openAuthVC()
    func closeVC()
}

class LoginViewController: UIViewController {
    
    var collectionView: UICollectionView!
    let slidesSlider = SliderSlides()
    var authVC: AuthViewController!
    var regVC: RegViewController!
    var slides: [Slides] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
        slides = slidesSlider.getSlides()
    }
    
    func configCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.bounces = false
        collectionView.alwaysBounceHorizontal = false
    
        collectionView.register(SlideCollectionViewCell.self)
//        collectionView.register(UINib(nibName: SlideCollectionViewCell.reuceId, bundle: nil), forCellWithReuseIdentifier: SlideCollectionViewCell.reuceId)
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension LoginViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return slides.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: SlideCollectionViewCell = collectionView.dequeue(forIndexPath: indexPath)
        cell.delegate = self
        let slide = slides[indexPath.row]
        cell.configure(slide: slide)
        return cell
    }
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return view.frame.size
    }
}

extension LoginViewController: LoginViewControllerDelegate {

    func openAuthVC() {
        if authVC == nil {
            authVC = UIStoryboard(name: "Main", bundle:
                nil).instantiateViewController(withIdentifier: "AuthViewController") as!
                AuthViewController?
        }
        authVC.delegate = self
        self.view.insertSubview(authVC.view, at: 1)
    }
    
    func openRegVC() {
        if regVC == nil {
            regVC = UIStoryboard(name: "Main", bundle:
                nil).instantiateViewController(withIdentifier: "RegViewController") as!
                RegViewController?
        }
        regVC.delegate = self
        self.view.insertSubview(regVC.view, at: 1)
    }

    func closeVC() {
        if authVC != nil {
            authVC.view.removeFromSuperview()
            authVC = nil
        }
        if regVC != nil {
            regVC.view.removeFromSuperview()
            regVC = nil
        }
    }
}
