//
//  PMRProgressHUD.h
//  Cherry
//
//  Created by Cherry on 2021/6/28.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CLProgressHUDStatus) {
    PMRProgressHUDStatusInfo,    ///< 警示
    PMRProgressHUDStatusFailure, ///< 失败
    PMRProgressHUDStatusSuccess, ///< 成功
    PMRProgressHUDStatusLoading  ///< 等待
};

@interface PMRProgressHUD : MBProgressHUD

/// 显示文字HUD
/// @param text 显示的文字内容
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)showMessage:(NSString *)text inView:(UIView *__nullable)view;

/// 显示带警示图片的HUD
/// @param text 显示的文字内容
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)showInfoMsg:(NSString *)text inView:(UIView *__nullable)view;

/// 显示带失败图片的HUD
/// @param text 显示的文字内容
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)showFailure:(NSString *)text inView:(UIView *__nullable)view;

/// 显示带成功图片的HUD
/// @param text 显示的文字内容
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)showSuccess:(NSString *)text inView:(UIView *__nullable)view;

/// 显示等待HUD，需手动关闭
/// @param text 显示的文字内容
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)showLoading:(NSString *)text inView:(UIView *__nullable)view;

/// 隐藏HUD
/// @param view 显示的容器View，为nil则添加在默认window上
+ (void)hideHUDForView:(UIView *__nullable)view;
@end

NS_ASSUME_NONNULL_END
