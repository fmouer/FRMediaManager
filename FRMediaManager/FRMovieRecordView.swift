//
//  FRMovieRecordView.swift
//  FRMediaManager
//
//  Created by fmouer on 15/11/6.
//  Copyright © 2015年 fmouer. All rights reserved.
//

import UIKit

class FRMovieRecordView: UIView {
    var moviewRecordOperation:FRMovieRecordOperation! = nil;
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.moviewRecordOperation = FRMovieRecordOperation.init();
        moviewRecordOperation.preViewLayer?.frame = self.bounds;
        moviewRecordOperation.preViewLayer?.masksToBounds = true;
        self.layer.addSublayer(moviewRecordOperation.preViewLayer!);
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startRecordVideo(){
        self.moviewRecordOperation.startRecordMovie();
    }
    
    func stopRecordVideo(){
        self.moviewRecordOperation.stopRecordMovie();
    }
    override func layoutSubviews() {
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
