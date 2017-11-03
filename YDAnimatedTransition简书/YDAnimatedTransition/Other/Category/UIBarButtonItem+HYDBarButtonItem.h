//
//  UIBarButtonItem+HYDBarButtonItem.h
//  印象—月赛
//
//  Created by mac on 17/6/6.
//  Copyright © 2017年 HYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYDBarButtonItem)
+(instancetype)initWithItem:(NSString *)image andSize:(CGSize)size andAlignment:(UIControlContentHorizontalAlignment)alignment andUIEdgeInsets:(UIEdgeInsets)edgeInsets andSelect:(SEL)select andTarget:(id)target;
+(instancetype)initWithStr:(NSString *)str andSize:(CGSize)size andAlignment:(UIControlContentHorizontalAlignment)alignment andUIEdgeInsets:(UIEdgeInsets)edgeInsets andSelect:(SEL)select andTarget:(id)target;
@end
