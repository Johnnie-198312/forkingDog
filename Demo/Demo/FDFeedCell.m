//
//  FDFeedCell.m
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedCell.h"
#import "Masonry.h"
@interface FDFeedCell ()

@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong)  UILabel *contentLabel;
@property (nonatomic, strong)  UIImageView *contentImageView;
@property (nonatomic, strong)  UILabel *usernameLabel;
@property (nonatomic, strong)  UILabel *timeLabel;

@end

@implementation FDFeedCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.bounds = [UIScreen mainScreen].bounds;
        self.titleLabel = [UILabel new];
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.backgroundColor = [UIColor redColor];
        
        self.contentLabel = [UILabel new];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.backgroundColor = [UIColor yellowColor];
        
        self.contentImageView = [UIImageView new];
        self.contentImageView.backgroundColor =[UIColor lightGrayColor];
        self.contentImageView.layer.borderColor = UIColor.blackColor.CGColor;
        self.contentImageView.layer.borderWidth = 2;
        [self.contentImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        self.usernameLabel =[UILabel new];
        self.usernameLabel.backgroundColor =[UIColor greenColor];
        self.timeLabel = [UILabel new];
        self.timeLabel.backgroundColor =[UIColor redColor];
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.contentImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.timeLabel];
        
    }
    return self;
}




- (void)setEntity:(FDFeedEntity *)entity
{
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.usernameLabel.text = entity.username;
    self.timeLabel.text = entity.time;
    [self.contentView layoutIfNeeded];
}
-(void)layoutSubviews{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(16).key(@"这个约束不合格1");
        make.right.equalTo(self.contentView).offset(-10).key(@"这个约束不合格2");
        make.top.equalTo(self.contentView).offset(10).key(@"这个约束不合格3");
        make.left.equalTo(self.usernameLabel).key(@"这个约束不合格4");
        make.bottom.equalTo(self.contentLabel.mas_top).offset(-10).key(@"这个约束不合格7");
    }];
    [self.titleLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisVertical];
    [self.titleLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10).key(@"这个约束不合格8");
        make.left.equalTo(self.titleLabel).key(@"这个约束不合格9");
        make.bottom.equalTo(self.contentImageView.mas_top).offset(-8).key(@"这个约束不合格10");
        //        make.top.equalTo(self.titleLabel.mas_bottom).offset(-10);
    }];
    
    [self.contentLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentLabel setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisVertical];
    [self.contentLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.lessThanOrEqualTo(self.contentView.mas_right).offset(-16).key(@"这个约束不合格13");
        make.left.equalTo(self.contentLabel).key(@"这个约束不合格14");
        make.bottom.equalTo(self.usernameLabel.mas_top).offset(-8);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(8);
    }];
    [self.contentImageView setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentImageView setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
    [self.contentImageView setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    [self.contentImageView setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-4);
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentImageView.mas_bottom).offset(8);
        make.baseline.equalTo(self.timeLabel);
    }];
    
    //    [self.usernameLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    //    [self.usernameLabel setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisVertical];
    //    [self.usernameLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    //    [self.usernameLabel setContentCompressionResistancePriority:1000 forAxis:UILayoutConstraintAxisVertical];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.baseline.equalTo(self.usernameLabel);
    }];
    //        [self.timeLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
    //        [self.timeLabel setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
    //        [self.timeLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisHorizontal];
    //        [self.timeLabel setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];
    
}

// If you are not using auto layout, override this method
- (CGSize)sizeThatFits:(CGSize)size
{
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.contentLabel sizeThatFits:size].height;
    totalHeight += [self.contentImageView sizeThatFits:size].height;
    totalHeight += [self.usernameLabel sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}

@end
