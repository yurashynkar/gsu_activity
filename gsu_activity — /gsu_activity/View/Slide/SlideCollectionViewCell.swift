//
//  SlideCollectionViewCell.swift
//  gsu_activity
//
//  Created by юра шинкар on 9.01.23.
//

import UIKit

class SlideCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var regBtn: UIButton!
    @IBOutlet weak var authBtn: UIButton!
    var delegate: LoginViewControllerDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(slide: Slides) {
        slideImage.image = slide.img
        descriptionText.text = slide.text
        
        if slide.id == 3 {
            regBtn.isHidden = false
            authBtn.isHidden = false
        }
    }
    
    @IBAction func regBtnClick(_ sender: Any) {
        delegate.openRegVC()
    }
    @IBAction func authBtnClick(_ sender: Any) {
        delegate.openAuthVC()
    }
}

extension SlideCollectionViewCell: NibLoadableView { }
