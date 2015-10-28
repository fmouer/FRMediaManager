//
//  ViewController.swift
//  FRMediaManager
//
//  Created by fmouer on 15/10/28.
//  Copyright © 2015年 fmouer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dataSource:NSArray!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataSource = ["视频","音频","其它"];
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell_id");
        cell.textLabel?.text = dataSource.objectAtIndex(indexPath.row) as? String;
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(__FUNCTION__)")
        self.performSegueWithIdentifier("pushToVideo", sender: self);
    }
    
    override func viewWillAppear(animated: Bool) {
        if (tableView.indexPathForSelectedRow != nil){
            tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true);
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pushToVideo"{
            var dest = segue.destinationViewController;
            print("dest is \(dest)");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

