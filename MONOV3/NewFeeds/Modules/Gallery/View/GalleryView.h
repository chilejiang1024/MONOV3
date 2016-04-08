//
//  GalleryView.h
//  MONOV3
//
//  Created by JiangChile on 16/4/6.
//  Copyright © 2016年 JiangChile. All rights reserved.
//

#import "BaseView.h"

@interface GalleryView : BaseView

@property (nonatomic, retain) BaseTableView *tableView;

- (void)setGalleryModelArr:(NSMutableArray *)galleryModelArr;

@end
