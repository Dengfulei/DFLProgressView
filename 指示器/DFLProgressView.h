//
//  DFLProgressView.h
//  指示器
//
//  Created by 杭州移领 on 16/12/21.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFLProgressView : UIView
/**< 进度条颜色 默认红色*/
@property (nonatomic , strong) UIColor *progressColor;
/**< 进度条背景色 默认灰色*/
@property (nonatomic , strong) UIColor *progressBackgroundColor;
/**< 进度条宽度 默认3*/
@property (nonatomic , assign) CGFloat progressWidth;
/**< 进度条进度 0-1*/
@property (nonatomic , assign) float percent;

+ (DFLProgressView *)showViewAddedTo:(UIView *)view imageName:(NSString *)name;
- (void)hide:(BOOL)animated after:(NSInteger)time;
@end
