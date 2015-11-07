//
//  FRMovieRecordOperation.swift
//  FRMediaManager
//
//  Created by fmouer on 15/11/6.
//  Copyright © 2015年 fmouer. All rights reserved.
//

import UIKit
import AVFoundation

class FRMovieRecordOperation: NSObject ,AVCaptureFileOutputRecordingDelegate{
    var captureSession:AVCaptureSession!;
    
    var preViewLayer:AVCaptureVideoPreviewLayer?;
    
    var movieFileOutput:AVCaptureMovieFileOutput?;
    
    var stillImageOutput:AVCaptureStillImageOutput?;
    
    private
    var fileOutputUrl:NSURL!;
    
    private
    var videoDeviceInput:AVCaptureDeviceInput!;
    
    override init() {
        super.init();
        self.initCaptureSession();
    }
    
    private func initCaptureSession(){
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
        
        self.fileOutputUrl = NSURL.init(fileURLWithPath:self.getFileOutPath() as String);
    }
    
    func startRecordMovie(){
        if ((movieFileOutput?.recording) == false){
            movieFileOutput?.startRecordingToOutputFileURL(self.fileOutputUrl, recordingDelegate: self);
        }
        
    }
    
    func stopRecordMovie(){
        movieFileOutput?.stopRecording();
    }
    
    func captureOutput(captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAtURL outputFileURL: NSURL!, fromConnections connections: [AnyObject]!, error: NSError!) {
        
        var mainCompositionInst = AVMutableVideoComposition.init()
        
    }
    func captureOutput(captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAtURL fileURL: NSURL!, fromConnections connections: [AnyObject]!) {
        
    }
    
    private func getFileOutPath()->NSString{
        var document = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true);
        var path:NSString = document[0];
        path = path.stringByAppendingPathComponent("file.mp4");
        print("file out is \(path)");
        return path;
    }
}
