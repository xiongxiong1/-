//
//  MoreControllerCell.m
//  xiaoquchaoshi
//
//  Created by caohaifeng on 8/27/16.
//  Copyright © 2016 大连友商科技有限公司. All rights reserved.
//

#import "MoreControllerCell.h"

@implementation MoreControllerCell

+(instancetype)createCellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item {
    
    static NSString *cellID = @"settingCell";
    MoreControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MoreControllerCell alloc] initWithStyle:[self loadCellStyleWithItem:item] reuseIdentifier:cellID];
    }
    return cell;
    
}

//定义方法返回cell的样式
+(UITableViewCellStyle)loadCellStyleWithItem:(NSDictionary *)item {
    
    if([item[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleValue1"])
    {
        return UITableViewCellStyleValue1;
    }
    else if([item[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleValue2"])
    {
        return UITableViewCellStyleValue2;
    }
    else if([item[@"UITableViewCellStyle"] isEqualToString:@"UITableViewCellStyleSubtitle"])
    {
        return UITableViewCellStyleSubtitle;
    }
    else
    {
        return UITableViewCellStyleDefault;
    }

}

//重写set方法
-(void)setItem:(NSDictionary *)item {
    _item = item;
    self.textLabel.text = item[@"title"];
    if(item[@"icon"] && [item[@"icon"] length] > 0)
    {
        self.imageView.image = [UIImage imageNamed:item[@"icon"]];
    }
    NSString *imageView = item[@"accessorView"];
    Class cla = NSClassFromString(imageView);
    id object = [[cla alloc] init];
    if ([object isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView = (UIImageView *)object;
        imageView.image = [UIImage imageNamed:@"arrow_right"];
        [imageView sizeToFit];
    }else if ([object isKindOfClass:[UIButton class]])
    {
        UIButton * button = (UIButton *)object;
        [button setTitle:@"上班" forState:UIControlStateNormal];
        button.width = 100;
        button.height = 40;
        [button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventValueChanged];
    }
    self.accessoryView = object;

}

//按钮的点击事件
- (void)buttonClick:(UIButton *)sender {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
