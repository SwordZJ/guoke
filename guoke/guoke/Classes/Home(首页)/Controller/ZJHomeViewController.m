//
//  ZJHomeViewController.m
//  guoke
//
//  Created by liuzhouji on 15/10/12.
//  Copyright (c) 2015年 ZJ. All rights reserved.
//

#import "ZJHomeViewController.h"
#import "XMGWaterflowLayout.h"

@interface ZJHomeViewController ()<XMGWaterflowLayoutDelegate>

@end

@implementation ZJHomeViewController
static NSString *const ZJNewsCellID = @"newsCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ZJNewsCellID];
}

- (instancetype)init{
    
    XMGWaterflowLayout *layout = [[XMGWaterflowLayout alloc] init];
    layout.delegate = self;
    return [super initWithCollectionViewLayout:layout];
}

#pragma mark -  <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZJNewsCellID forIndexPath:indexPath];
    cell.backgroundColor = ZJRandomColor;
    
    return cell;
}

#pragma mark - <XMGWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(XMGWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth{
//    NSUInteger columnCount = (NSInteger)[self columnCountInWaterflowLayout:waterflowLayout];
    
    CGFloat height = arc4random_uniform(5) % 3 * 50 + 100;
    return height;
}

@end
