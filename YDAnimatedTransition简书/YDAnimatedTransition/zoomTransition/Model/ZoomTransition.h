//
//  ZoomTransition.h
//  YDAnimatedTransition
//
//  Created by 黄亚栋 on 2017/10/17.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZoomTransition : NSObject<UIViewControllerAnimatedTransitioning>

/*
 转场类型
 */
@property (nonatomic,assign)TransitionType transitiontype;

@end
