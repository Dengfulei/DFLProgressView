//
//  DFLProgressView.m
//  指示器
//
//  Created by 杭州移领 on 16/12/21.
//  Copyright © 2016年 DFL. All rights reserved.
//

#import "DFLProgressView.h"
@interface DFLProgressView ()

@property (nonatomic , strong) UIImageView *imageView;
//@property (nonatomic , strong) UILabel *textLabel;

@end
@implementation DFLProgressView

+ (DFLProgressView *)showViewAddedTo:(UIView *)view imageName:(NSString *)name {
    
    DFLProgressView *showView = [[self alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    showView.imageView.image = [UIImage imageNamed:name];
    
    showView.backgroundColor = [UIColor yellowColor];

    showView.center = view.center;
    
    [view addSubview:showView];
    
    return showView;
}

- (void)hide:(BOOL)animated after:(NSInteger)time {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (animated) {
            
            [self removeFromSuperview];
        }
        
    });
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initData];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
       
        [self initData];
    }
    
    return self;
}

- (void)initData {
    self.layer.masksToBounds = YES;
    self.progressWidth = 3.0;
    
    self.progressColor = [UIColor redColor];
    
    self.progressBackgroundColor = [UIColor grayColor];
    
    self.percent = 0.0;

    self.imageView = [UIImageView new];
    
    self.imageView.backgroundColor = [UIColor redColor];
    
    self.imageView.frame = CGRectMake((self.frame.size.width - 30)/2, (self.frame.size.height - 30)/2, 30, 30);
    
    [self addSubview:self.imageView];
    
//    self.textLabel = [[UILabel alloc] initWithFrame:self.bounds];
//    self.textLabel.backgroundColor = [UIColor yellowColor];
//    [self addSubview:self.textLabel];
   
}


- (void)setPercent:(float)percent {
    
    _percent = percent;
    
    if (_percent < 0) {return;}
//    self.textLabel.text = [NSString stringWithFormat:@"%.0f％",_percent*100];
    
    [self setNeedsDisplay];
    
    
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetShouldAntialias(context, YES);
   
    CGContextAddArc(context, self.frame.size.width / 2, self.frame.size.height / 2, (self.frame.size.width-self.progressWidth) / 2, 0, M_PI*2, 0);
   
    [self.progressBackgroundColor setStroke];
   
    CGContextSetLineWidth(context, self.progressWidth);
   
    CGContextStrokePath(context);
   
    if(self.percent != 0.0f)
    {
        CGFloat angle = 2 * self.percent * M_PI - M_PI_2;
        
        CGContextAddArc(context, self.frame.size.width / 2, self.frame.size.height / 2, (self.frame.size.width - self.progressWidth) / 2, -M_PI_2, angle, 0);
      
        [self.progressColor setStroke];
       
        CGContextSetLineWidth(context, self.progressWidth);
       
        CGContextStrokePath(context);
    }
}

@end
