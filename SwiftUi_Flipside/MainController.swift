//
//  MainController.swift
//  SwiftUi_Flipside
//
//  Created by Larry Shannon on 11/9/19.
//  Copyright © 2019 Larry Shannon. All rights reserved.
//

import UIKit
import LBTATools

struct CoverPage {
    let imageName: String
    let articleTitle: String
}

class PostCell: LBTAListCell<CoverPage> {
    
    override var item: CoverPage! {
        didSet {
//            imageView.image = UIImage(named: item)
            imageView.image = UIImage(named: item.imageName)
            titleLable.text = item.articleTitle
        }
    }
    

    let imageView = UIImageView(image: UIImage(named: "trump_back"), contentMode: .scaleAspectFill)
    
    let titleLable = UILabel(text: "Is Trump Racist?", font: UIFont(name: "HelveticaNeue-CondensedBold", size: 40), textColor: UIColor.white, textAlignment: .center, numberOfLines: 1)
    
    let leftArticleLogo = UIImageView(image: UIImage(named: "logo_cnn_badge_2up"))
    let rightArticleLogo = UIImageView(image: UIImage(named: "fox-news-logo"))

    override func setupViews() {
        
        leftArticleLogo.layer.cornerRadius = 50
        leftArticleLogo.contentMode = .scaleAspectFill
        leftArticleLogo.clipsToBounds = true
        
        rightArticleLogo.layer.cornerRadius = 50
        rightArticleLogo.clipsToBounds = true
        rightArticleLogo.contentMode = .scaleAspectFill
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        stack(
            titleLable,
              hstack(leftArticleLogo.withSize(.init(width: 100, height: 100)),
                     rightArticleLogo.withSize(.init(width: 100, height: 100)),
                                               spacing: 50
              ),
              UIView().withHeight(600),
              alignment:.center

        )
        
    }
    
}

class MainController: LBTAListController<PostCell, CoverPage>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .init(white: 0.9, alpha: 1)
        collectionView?.isPagingEnabled = true
            
//        self.items = ["trump_back", "money_back", "trump_back", "money_back", "trump_back", "money_back"]
        
        self.items = [
            CoverPage(imageName: "trump_back", articleTitle: "Is Trump Racist?"),
            CoverPage(imageName: "money_back", articleTitle: "A Breif on Taxation."),
            CoverPage(imageName: "trump_back", articleTitle: "Is Trump Racist?"),
            CoverPage(imageName: "money_back", articleTitle: "A Breif on Taxation."),
            CoverPage(imageName: "trump_back", articleTitle: "Is Trump Racist?"),
            CoverPage(imageName: "money_back", articleTitle: "A Breif on Taxation.")
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
