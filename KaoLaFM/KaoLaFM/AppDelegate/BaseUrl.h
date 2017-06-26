//
//  BaseUrl.h
//  Kaola
//
//  Created by sunny_FX on 2017/3/30.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#ifndef BaseUrl_h
#define BaseUrl_h



#define host_url        @"http://api.kaolafm.com"

#define tabbar_url      @"http://api.kaolafm.com/api/v4/new/navigate/list?"
/**
 *  精选
 */
#define selection_url   @"http://api.kaolafm.com/api/v4/pagecontent/list?"


/**
 *  分类
 */
//热门分类
#define category_hot_url   @"http://api.kaolafm.com/api/v4/category/get/allinfo?"
//其他分类
#define category_other_url   @"http://api.kaolafm.com/api/v4/category/get/oldinfo?"
//调频
#define category_broad_url   @"http://api.kaolafm.com/api/v4/category/get/broadinfo?"


/**
 发现
 */
#define discover_url @"http://api.kaolafm.com/api/v4/labelinfo/get?"

/**
 订阅
 */
#define subscribe_url @"http://api.kaolafm.com/api/v4/user/like?"


#endif /* BaseUrl_h */
