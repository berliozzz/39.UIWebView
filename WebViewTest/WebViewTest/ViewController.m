//
//  ViewController.m
//  WebViewTest
//
//  Created by Nikolay Berlioz on 15.03.16.
//  Copyright © 2016 Nikolay Berlioz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     
    // for internet link
    NSString *urlString = @"http://vk.com/iosdevcourse";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
     */
    
    
    /*
    
    NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    [self.webView loadData:fileData MIMEType:@"application/pdf" textEncodingName:@"UTF-8" baseURL:nil];
     
     */
    
    /*
    //for local file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];

    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    
    [self.webView loadRequest:request];
    */
    
    NSString *htmlString = @"<html>"
                                "<body>"
                                    "<p style=\"font-size: 500%%; text-align: center;\">Hello World!</p>"
                                "</body>"
                            "</html>";
    
    [self.webView loadHTMLString:htmlString baseURL:nil];

}

#pragma mark - Actions

- (IBAction) actionBack:(id)sender
{
    if ([self.webView canGoBack])
    {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction) actionForward:(id)sender
{
    if ([self.webView canGoForward])
    {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction) actionRefresh:(id)sender
{
    [self.webView stopLoading];
    [self.webView reload];
}

#pragma mark - Private Methods

- (void) refreshButtons
{
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
    
    
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidStartLoad");
    
    [self.indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    NSLog(@"didFailLoadWithError %@", [error localizedDescription]);
    
    [self.indicator stopAnimating];
    
    [self refreshButtons];
}



@end
