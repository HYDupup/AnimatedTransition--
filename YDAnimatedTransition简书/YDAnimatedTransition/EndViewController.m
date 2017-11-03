//
//  EndViewController.m
//  YDAnimatedTransition
//
//  Created by 黄亚栋 on 2017/10/17.
//  Copyright © 2017年 黄亚栋. All rights reserved.
//

#import "EndViewController.h"
#import "ThirdViewController.h"
#import "ViewController.h"

#define RANDOM_FLOAT(MIN,MAX) (((CGFloat)arc4random() / 0x100000000) * (MAX - MIN) + MIN);

@interface EndViewController ()<UINavigationControllerDelegate>

@property (nonatomic,strong)UIImageView *backImageView;

@property (nonatomic,strong)UIPercentDrivenInteractiveTransition *interactive;
@property (nonatomic,assign)BOOL isClickPush;


@end

@implementation EndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactive = [[UIPercentDrivenInteractiveTransition alloc]init];
    [self CreatUI];
}


#pragma mark CreatUI
-(void)CreatUI{
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.backImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.backImageView.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:self.backImageView];
    
    UIPanGestureRecognizer *Pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(Pan:)];
    [self.view addGestureRecognizer:Pan];
 
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.isClickPush = YES;
    self.navigationController.delegate = self;
}


-(void)Pan:(UIPanGestureRecognizer *)recognizer{
    CGPoint translatedPoint = [recognizer translationInView:self.view];
    CGFloat persent =  translatedPoint.x /  [[UIScreen mainScreen]bounds].size.width;
    persent = fabs(persent);
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:{
            self.isClickPush = NO;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //手势过程中，通过updateInteractiveTransition设置pop过程进行的百分比
            [self.interactive updateInteractiveTransition:persent];
            break;
        }
        case UIGestureRecognizerStateEnded:{
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            if (persent > 0.5) {
                [self.interactive finishInteractiveTransition];
            }else{
                [self.interactive cancelInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark 自定义转场动画
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPop) {
        ViewController *vc = (ViewController *)[self.navigationController.childViewControllers objectAtIndex:0];
        return vc.transition;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.isClickPush) {
        return nil;
    }else{
        return self.interactive;
    }
}




-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [self.navigationController pushViewController:[[ThirdViewController alloc]init] animated:YES];
    
//    
//    //裁剪图片
//    UIImage *image = self.backImageView.image;
//    CGImageRef imageRef = image.CGImage;
//    CGFloat width = CGImageGetWidth(imageRef);
//    CGFloat height = CGImageGetHeight(imageRef);
//    CGFloat scale = width/100;
//    
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50*scale, 50*scale), YES, scale);
//    [image drawInRect:CGRectMake(-50*scale, -50*scale, width,height)];
//    UIImage *resultImg = UIGraphicsGetImageFromCurrentImageContext();//从当前上下文中获得最终图片
//    UIGraphicsEndImageContext();//关闭上下文
//
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 250, 100, 100)];
//    imageView.image = resultImg;
//    [self.view addSubview:imageView];
    
    
//    [UIView animateWithDuration:3 animations:^{
//        self.backImageView.transform = CGAffineTransformScale(self.backImageView.transform, 1.5, 1.5);
//    } completion:^(BOOL finished) {
//        CGFloat width = 100/1.5;
//        CGFloat height = 100/1.5;
//        CGFloat x = 50+(100*0.5)/2;
//        CGFloat y = 50+(100*0.5)/2;
//        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
//        CAShapeLayer *shape = [CAShapeLayer new];
//        shape.path = path.CGPath;
////        self.backImageView.layer.mask = shape;
//        [self.backImageView.layer addSublayer:shape];
//
//    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
