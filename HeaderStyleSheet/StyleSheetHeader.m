//
//  StyleSheetHeader.m
//  HeaderStyleSheet
//
//  Created by zouyou on 2017/9/7.
//  Copyright © 2017年 zouyou. All rights reserved.
//

#import "StyleSheetHeader.h"
#import "Masonry.h"

@interface StyleSheetHeader(){
    
}
@property (nonatomic , strong) UIButton * bt1;
@property (nonatomic , strong) UIButton * bt2;
@property (nonatomic , strong) UIButton * bt3 ;

@property (nonatomic , strong) UIView * view;
@property (nonatomic , strong) UILabel * titleLabel;
@end

@implementation StyleSheetHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if(self){
        [self initializeUserinterface];
        
        [self updateConstraints];
        [self updateFocusIfNeeded];
    }
    
    return  self;
}



#pragma mark -- private method
- (void)initializeUserinterface{
    [self.contentView addSubview:self.bt1];
    [self.contentView addSubview:self.bt2];
    [self.contentView addSubview:self.bt3];
    
    [self.contentView addSubview:self.view];
    
    [self.view addSubview:self.titleLabel];
}

- (void)tapOnView:(UITapGestureRecognizer *)sender{
    
    __weak typeof(self) ws = self;
    
    if (CGRectGetMaxX(self.view.frame)/2 == CGRectGetWidth(self.bounds)/2){
        [UIView animateWithDuration:0.2 animations:^{
            [ws.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(ws.mas_centerX).offset(-180);

            }];
            
            [ws.view.superview layoutIfNeeded];
        }];
        
        
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            [ws.view mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(ws.mas_centerX);

            }];
            
            
            [ws layoutIfNeeded];
        }];
        
        
    }
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
    __weak typeof(self) ws = self ;
    
    [self.bt3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right);
        make.top.equalTo(ws.mas_top);
        make.bottom.equalTo(ws.mas_bottom);
        make.width.equalTo(@60);
    }];
    
    [self.bt2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.bt3.mas_left);
        make.top.equalTo(ws.mas_top);
        make.bottom.equalTo(ws.mas_bottom);
        make.width.equalTo(@60);
    }];
    
    [self.bt1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.bt2.mas_left);
        make.top.equalTo(ws.mas_top);
        make.bottom.equalTo(ws.mas_bottom);
        make.width.equalTo(@60);
    }];
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX).priorityMedium();
        make.centerY.equalTo(ws.mas_centerY);
        make.width.equalTo(ws.mas_width);
        make.height.equalTo(ws.mas_height);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left).offset(15);
        make.centerY.equalTo(ws.view.mas_centerY);
        make.width.equalTo(@100);
        make.height.equalTo(ws.view.mas_height).multipliedBy(0.5);
    }];
}

- (void)tapOnBt:(UIButton *)sender{
    NSLog(@"cmd : %@", NSStringFromSelector(_cmd));
    if ([sender isEqual:self.bt1]){
        NSLog(@"%@",@"bt1 have been taped");
    }
    
    if([sender isEqual:self.bt2]){
        NSLog(@"%@",@"bt2 have been taped");
    }
    
    if([sender isEqual:self.bt3]){
        NSLog(@"%@" , @"bt3 hava been taped");
    }
}

#pragma mark -- lazy loading
- (UIButton *)bt1{
    if (!_bt1){
        _bt1 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _bt1.backgroundColor = [UIColor cyanColor];
        
        [_bt1 addTarget:self action:@selector(tapOnBt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bt1;
}

- (UIButton *)bt2{
    if(!_bt2){
        _bt2 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _bt2.backgroundColor = [UIColor purpleColor];
        
        [_bt2 addTarget:self action:@selector(tapOnBt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bt2;
}

- (UIButton *)bt3{
    if(!_bt3){
        _bt3 = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _bt3.backgroundColor = [UIColor redColor];
        
        [_bt3 addTarget:self action:@selector(tapOnBt:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bt3;
}

- (UIView *)view{
    if(!_view){
        _view = [[UIView alloc] init];
        
        _view.backgroundColor = [UIColor yellowColor];
        
       
        
        [_view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnView:)] ];
    }
    return _view;
}

- (UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        
        _titleLabel.text = @"test";
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
@end
