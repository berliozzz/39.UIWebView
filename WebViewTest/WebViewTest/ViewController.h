//
//  ViewController.h
//  WebViewTest
//
//  Created by Nikolay Berlioz on 15.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

- (IBAction) actionBack:(id)sender;
- (IBAction) actionForward:(id)sender;
- (IBAction) actionRefresh:(id)sender;


@end

