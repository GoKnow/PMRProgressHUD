//
//  PMRProgressHUD.m
//  Cherry
//
//  Created by Cherry on 2021/6/28.
//

#define HUD_DELAY_TIME 2.0
#define HUD_MINE_SIZE 90
#define HUD_FONT_SIZE 16

#import "PMRProgressHUD.h"

@implementation PMRProgressHUD

+ (void)showStatus:(CLProgressHUDStatus)status text:(NSString *)text inView:(UIView *)view {
    
    if (view == nil) {
            
        view = [[UIApplication sharedApplication].windows lastObject];
    }
        
    PMRProgressHUD *hud = [PMRProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    hud.label.text = text;
    hud.label.font = [UIFont boldSystemFontOfSize:HUD_FONT_SIZE];
    hud.contentColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    hud.minSize = CGSizeMake(HUD_MINE_SIZE, HUD_MINE_SIZE);

    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"PMRProgressHUD" ofType:@"bundle"];

    switch (status) {
            
        case PMRProgressHUDStatusInfo: {
            
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"hud_info"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];

            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            [hud hideAnimated:YES afterDelay:HUD_DELAY_TIME];
        }
            break;
        case PMRProgressHUDStatusFailure: {
            
            NSString *failurePath = [bundlePath stringByAppendingPathComponent:@"hud_failure"];
            UIImage *failureImage = [UIImage imageWithContentsOfFile:failurePath];

            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *failureView = [[UIImageView alloc] initWithImage:failureImage];
            hud.customView = failureView;
            [hud hideAnimated:YES afterDelay:HUD_DELAY_TIME];
        }
            break;
        case PMRProgressHUDStatusSuccess: {
            
            NSString *successPath = [bundlePath stringByAppendingPathComponent:@"hud_success"];
            UIImage *succsessImage = [UIImage imageWithContentsOfFile:successPath];

            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *successView = [[UIImageView alloc] initWithImage:succsessImage];
            hud.customView = successView;
            [hud hideAnimated:YES afterDelay:HUD_DELAY_TIME];
        }
            break;
        case PMRProgressHUDStatusLoading: {
            
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
        default:
            break;
    }
}

+ (void)showMessage:(NSString *)text inView:(UIView *)view {
    
    if (view == nil) {
            
        view = [[UIApplication sharedApplication].windows lastObject];
    }
        
    PMRProgressHUD *hud = [PMRProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    hud.label.text = text;
    hud.label.font = [UIFont boldSystemFontOfSize:HUD_FONT_SIZE];
    hud.contentColor = [UIColor whiteColor];
    hud.minSize = CGSizeZero;
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:HUD_DELAY_TIME];
}

+ (void)showInfoMsg:(NSString *)text inView:(UIView *)view {
    
    [self showStatus:PMRProgressHUDStatusInfo text:text inView:view];
}

+ (void)showFailure:(NSString *)text inView:(UIView *)view {
    
    [self showStatus:PMRProgressHUDStatusFailure text:text inView:view];
}

+ (void)showSuccess:(NSString *)text inView:(UIView *)view {
    
    [self showStatus:PMRProgressHUDStatusSuccess text:text inView:view];
}

+ (void)showLoading:(NSString *)text inView:(UIView *)view {
    
    [self showStatus:PMRProgressHUDStatusLoading text:text inView:view];
}

+ (void)hideHUDForView:(UIView *)view {
    
    if (view == nil) {
        
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    [self hideHUDForView:view animated:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
