//
//  MCDreamCateSearchHeader.h
//  Tools
//
//  Created by 常峻玮 on 15/11/12.
//  Copyright © 2015年 Mingle. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCDreamCateSearchHeader;

@protocol MCDreamCateSearchHeaderDelegate <NSObject>

-(void)dreamCateSearchHeader:(MCDreamCateSearchHeader *)header search:(NSString *)key;

@end
@interface MCDreamCateSearchHeader : UICollectionReusableView
@property(nonatomic,assign)id<MCDreamCateSearchHeaderDelegate> delegate;
@end
