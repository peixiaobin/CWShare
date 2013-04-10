//
//  ViewController.m
//  CWShareDemo
//
//  Created by Wang Jun on 12-8-17.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize cwShare;

- (void)dealloc
{
    [self setCwShare:nil];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.cwShare = [[[CWShare alloc] init] autorelease];
    [cwShare setDelegate:self];
    [cwShare setParentViewController:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - IBAction Event Method

- (IBAction)sinaAuthorizeAction:(id)sender
{
    [cwShare startSinaAuthorize];
}

- (IBAction)sinaShareContent:(id)sender
{
    [cwShare sinaShareWithContent:[NSString stringWithFormat:@"%d it's a debug test from my app, you can ignore this message.", arc4random()]];
}

- (IBAction)sinaShareContentAndImage:(id)sender
{
    UIImage *uploadImage = [UIImage imageNamed:@"blackArrow@2x.png"];
    [cwShare sinaShareWithContent:[NSString stringWithFormat:@"%d it's a debug test from my app, you can ignore this message.", arc4random()] withImage:uploadImage];
}

- (IBAction)tencentAuthorizeAction:(id)sender
{
    [cwShare startTencentAuthorize];
}

- (IBAction)tencentShareToQQZone:(id)sender
{
    [cwShare tencentShareToQQZoneWithDescription:[NSString stringWithFormat:@"%d share description", arc4random()] withTitle:[NSString stringWithFormat:@"%d share title", arc4random()] Content:[NSString stringWithFormat:@"%d it's a debug test from my app, you can ignore this message.", arc4random()] withSynchronizeWeibo:NO];
}

- (IBAction)tencentShareContentToWeiBo:(id)sender
{
    [cwShare tencentShareToWeiBoWithContent:[NSString stringWithFormat:@"%d it's a debug test from my app, you can ignore this message.", arc4random()]];
}

- (IBAction)tencentShareContentAndImageToWeiBo:(id)sender
{
    UIImage *uploadImage = [UIImage imageNamed:@"blackArrow@2x.png"];
    [cwShare tencentShareToWeiBoWithContent:[NSString stringWithFormat:@"%d it's a debug test from my app, you can ignore this message.", arc4random()] withImage:uploadImage];
}

#pragma mark - CWShare Delegate

- (void)authorizeFailForShareType:(CWShareType)shareType
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪授权失败");
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯授权失败");
    }
}

- (void)authorizeFinishForShareType:(CWShareType)shareType withData:(NSDictionary *)userInfo
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪授权成功");
        NSLog(@"%@", userInfo);
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯授权成功");
        NSLog(@"%@", userInfo);
    }
}

- (void)shareContentFailForShareType:(CWShareType)shareType
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪分享内容失败");
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯分享内容失败");
    }
}

- (void)shareContentFinishForShareType:(CWShareType)shareType
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪分享内容成功");
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯分享内容成功");
    }
}

- (void)shareContentAndImageFailForShareType:(CWShareType)shareType
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪分享图片失败");
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯分享图片失败");
    }
}

- (void)shareContentAndImageFinishForShareType:(CWShareType)shareType
{
    if (shareType == CWShareTypeSina) {
        NSLog(@"新浪分享图片成功");
    } else if (shareType == CWShareTypeTencent) {
        NSLog(@"腾讯分享图片成功");
    }
}

@end
