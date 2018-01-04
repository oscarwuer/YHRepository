//
//  YHFlowLayoutModel.h
//  Oscar
//
//  Created by 张长弓 on 2018/1/4.
//  Copyright © 2018年 yahui.zhang. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface YHFlowLayoutModel : JSONModel

@property (nonatomic, copy) NSString *film_id;
@property (nonatomic, copy) NSString *film_name;
@property (nonatomic, copy) NSString *film_type;
@property (nonatomic, copy) NSString *film_desc;
@property (nonatomic, copy) NSString *poster_img;

@end
