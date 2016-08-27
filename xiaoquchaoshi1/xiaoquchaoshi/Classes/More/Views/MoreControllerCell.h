//
//  MoreControllerCell.h
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/27/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreControllerCell : UITableViewCell

//创建的类方法
+(instancetype)createCellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item;
//字典数组
@property(nonatomic,strong)NSDictionary *item;

@end
