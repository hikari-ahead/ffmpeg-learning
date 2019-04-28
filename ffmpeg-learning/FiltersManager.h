//
//  FiltersManager.h
//  ffmpeg-learning
//
//  Created by resober on 2019/4/26.
//  Copyright © 2019 resober. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FiltersManager : NSObject
@property (nonatomic, copy) NSString *filterName;
- (UIImage *)imageFromFilter;
@end

NS_ASSUME_NONNULL_END
