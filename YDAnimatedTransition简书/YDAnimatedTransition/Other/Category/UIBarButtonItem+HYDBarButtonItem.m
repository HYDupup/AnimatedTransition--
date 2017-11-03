//
//  UIBarButtonItem+HYDBarButtonItem.m
//  印象—月赛
//
//  Created by mac on 17/6/6.
//  Copyright © 2017年 HYD. All rights reserved.
//

#import "UIBarButtonItem+HYDBarButtonItem.h"

@implementation UIBarButtonItem (HYDBarButtonItem)

/**
 image 按钮图片
 size 按钮大小
 alignment 文字对齐方向
 edgeinsets 文字强制偏移量
 select 按钮点击方法
 target 响应对象
 */
+(instancetype)initWithItem:(NSString *)image andSize:(CGSize)size andAlignment:(UIControlContentHorizontalAlignment)alignment andUIEdgeInsets:(UIEdgeInsets)edgeInsets andSelect:(SEL)select andTarget:(id)target{
    UIButton *Btn = [[UIButton alloc]init];
    [Btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    Btn.size = size;
    Btn.contentHorizontalAlignment = alignment;
    Btn.contentEdgeInsets = edgeInsets;
    [Btn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:Btn];
}

/**
 str 按钮名称
 size 按钮大小
 alignment 文字对齐方向
 edgeinsets 文字强制偏移量
 select 按钮点击方法
 target 响应对象
 */
+(instancetype)initWithStr:(NSString *)str andSize:(CGSize)size andAlignment:(UIControlContentHorizontalAlignment)alignment andUIEdgeInsets:(UIEdgeInsets)edgeInsets andSelect:(SEL)select andTarget:(id)target{
    UIButton *Btn = [[UIButton alloc]init];
    [Btn setTitle:str forState:UIControlStateNormal];
    [Btn.titleLabel setFont:[UIFont systemFontOfSize:16.0f]];
    [Btn setTitleColor:HYDColour(227.0, 186.0, 88.0) forState:UIControlStateNormal];
    [Btn setTitleColor:HYDColour(180.0, 180.0, 180.0) forState:UIControlStateHighlighted];
    Btn.size = size;
    Btn.contentHorizontalAlignment = alignment;
    Btn.contentEdgeInsets = edgeInsets;
    [Btn addTarget:target action:select forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:Btn];
}

@end
