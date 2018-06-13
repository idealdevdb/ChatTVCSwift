//
//  IDSwiftForumCellTest.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 13/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftForumCellTest: IDSwiftForumCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.profileImageRemoteUser = UIImage(named: "person2.png")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
