//
//  FRMovieRecordOperation.swift
//  FRMediaManager
//
//  Created by fmouer on 15/11/6.
//  Copyright © 2015年 fmouer. All rights reserved.
//

import UIKit
import AVFoundation

class FRMovieRecordOperation: NSObject {
    var captureSession:AVCaptureSession!;
    
    var preViewLayer:AVCaptureVideoPreviewLayer?;
    
    var movieFileOutput:AVCaptureMovieFileOutput?;
    
    var stillImageOutput:AVCaptureStillImageOutput?;
    
    private
    var videoDeviceInput:AVCaptureDeviceInput!;
    
    override init() {
        super.init();
        self.initCaptureSession();
    }
    
    func initCaptureSession(){
        captureSession = AVCaptureSession.init();
        //input
        var frontCamera:AVCaptureDevice?;
        var backCamera:AVCaptureDevice?;
        
        let cameras = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo);
        for temp in cameras {
            let camera:AVCaptureDevice = temp as! AVCaptureDevice;
            if camera.position == .Front {
                frontCamera = camera;
            } else {
                backCamera = camera;
            }
        }

        let audioDeviceInput:AVCaptureDeviceInput = try! AVCaptureDeviceInput.init(device: AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio));
        if self.captureSession .canAddInput(audioDeviceInput){
            self.captureSession.addInput(audioDeviceInput);
        }
        
        self.videoDeviceInput = try! AVCaptureDeviceInput.init(device: backCamera);
        if self.captureSession .canAddInput(videoDeviceInput){
            self.captureSession.addInput(videoDeviceInput);
        }
        
        self.movieFileOutput = AVCaptureMovieFileOutput.init();
        
        self.captureSession.addOutput(movieFileOutput);
        captureSession.sessionPreset = AVCaptureSessionPresetHigh;

        self.preViewLayer = AVCaptureVideoPreviewLayer.init(session: self.captureSession);
        preViewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill;
        preViewLayer?.backgroundColor = UIColor.blackColor().CGColor;
        self.captureSession.startRunning();
    }
}
