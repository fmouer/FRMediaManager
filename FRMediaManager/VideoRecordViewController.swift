//
//  VideoRecordViewController.swift
//  FRMediaManager
//
//  Created by fmouer on 15/11/6.
//  Copyright © 2015年 fmouer. All rights reserved.
//

import UIKit

class VideoRecordViewController: UIViewController {
    var movieRecordView:FRMovieRecordView! = nil;
    var recordButton:UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieRecordView = FRMovieRecordView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width));
        self.view.addSubview(movieRecordView);
        movieRecordView.backgroundColor = UIColor.redColor();
        
        // Do any additional setup after loading the view.
        recordButton = UIButton(frame: CGRectMake(100,CGRectGetMaxY(movieRecordView.frame)+20,60,60));
        recordButton.addTarget(self, action: Selector("recordButtonEvent:"), forControlEvents: .TouchUpInside);
        self.view.addSubview(recordButton);
        recordButton.backgroundColor = UIColor.redColor();
    }
    
    func recordButtonEvent(button:UIButton){
        if button.selected == true{
            movieRecordView.stopRecordVideo();
        }else{
            movieRecordView.startRecordVideo();
        }
        button.selected = !button.selected;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
