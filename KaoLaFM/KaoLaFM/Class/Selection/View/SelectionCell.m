//
//  SelectionCell.m
//  KaoLaFM
//
//  Created by sunny_FX on 2017/5/22.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "SelectionCell.h"
#import "SelectionCellFrame.h"
#import "SelectionDataList.h"



@implementation SelectionCell

-(void)setCellModel:(SelectionDataList *)cellModel{
    if (!cellModel) return;
    _cellModel = cellModel;

}

-(void)setCellFrame:(SelectionCellFrame *)cellFrame{
    if (_cellFrame == cellFrame && _cellFrame) return;
    _cellFrame = cellFrame;
    self.dataList = cellFrame.cellModel.dataList;
    UILabel *title = [[UILabel alloc]initWithFrame:cellFrame.titleRect];
    title.text = cellFrame.cellModel.name;
//    title.backgroundColor = [UIColor orangeColor];

    UIView *line = [[UIView alloc]initWithFrame:cellFrame.lineRect];
    line.backgroundColor = UIColorFromRGB(248, 248, 248);
    [self addSubview:line];
    

    if (cellFrame.hasmoreType == SelectionCellType_Hasmore) {
        UIButton *hasmoreBtn = [UIButton new];
        hasmoreBtn.frame = cellFrame.hasmoreRect;
        hasmoreBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"hasMore"]];
        [hasmoreBtn setImage:[UIImage imageNamed:@"hasMore_icon"] forState:UIControlStateNormal];
        [self addSubview:hasmoreBtn];
    }

    if (cellFrame.componentType == SelectionCellComponentType_Three) {
        [self addSubview:title];
        [self SelectionCellComponentType_Three:cellFrame];
        
    }else if (cellFrame.componentType == SelectionCellComponentType_Single){
        [self addSubview:title];
        [self SelectionCellComponentType_Single:cellFrame];
        
    }else if(cellFrame.componentType == SelectionCellComponentType_Project){
        [self SelectionCellComponentType_Project:cellFrame];
        
    }else{
        [self addSubview:title];

    }
    
}
- (void)SelectionCellComponentType_Three:(SelectionCellFrame *)cellFrame{
    for (NSInteger i = 0; i < cellFrame.mArrRects.count; i ++) {
        NSDictionary *dic = (NSDictionary *)cellFrame.cellModel.dataList[i];
        
        UIView *view = [UIView new];
        UIImageView *IV = [UIImageView new];
        UILabel *rname = [Factory createLabelWithTitle:[HelperTools isBlankString:dic[@"rname"]] textColor:rnameColor fontSize:14.0f textAlignment:NSTextAlignmentLeft];
        UILabel *albumName = [Factory createLabelWithTitle:[HelperTools isBlankString:dic[@"albumName"]] textColor:albumNameColor fontSize:14.0f textAlignment:NSTextAlignmentLeft];
        UIButton *playerBtn = [UIButton new];
        
        playerBtn.tag = 100 + i;
        playerBtn.selected = NO;
        [playerBtn setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        [playerBtn addTarget:self action:@selector(player:) forControlEvents:UIControlEventTouchUpInside];
//        playerBtn.backgroundColor = [UIColor clearColor];
        [IV sd_setImageWithURL:dic[@"pic"]];
        rname.numberOfLines = 2;
        albumName.numberOfLines = 1;
        
        view.frame = [HelperTools withNSValue:cellFrame.mArrRects[i]];
        IV.frame = CGRectMake(0, 0, view.width, view.width);
        rname.frame = CGRectMake(IV.left, IV.bottom, IV.width, view.height - view.width - 20);
        albumName.frame = CGRectMake(IV.left, rname.bottom, IV.width, 20);
        playerBtn.frame = CGRectMake(IV.right - 30, IV.bottom - 30, 25, 25);

        IV.userInteractionEnabled = YES;
        [IV addSubview:playerBtn];
        [view addSubview:albumName];
        [view addSubview:rname];
        [view addSubview:IV];
        [self addSubview:view];
    }

}

- (void)player:(UIButton *)sender{
    UIButton *button = (UIButton *)[self viewWithTag:sender.tag];
    NSInteger n;
    if (!button.selected) {
        
        [self.last_btn setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        self.last_btn.selected = NO;

        button.selected = YES;
        [button setImage:[UIImage imageNamed:@"btn_player_pause_on"] forState:UIControlStateNormal];
        n = 1;
        

    }else{
        [self.last_btn setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        self.last_btn.selected = YES;

        button.selected = NO;
        [button setImage:[UIImage imageNamed:@"btn_player_play_on"] forState:UIControlStateNormal];
        n = 0;
    }
    
    self.last_btn = button;
    NSDictionary *dic = self.dataList[button.tag - 100];

    NSString *m;
    if (self.albumId == [dic[@"albumId"] longLongValue]) {
        m = @"1";
    } else {
        m = @"0";
        self.albumId = [dic[@"albumId"] longLongValue];
    }
    
    [AppNotification send:NOTIFICATION_TYPE_PALYER userInfo:@{PALYER_KEY:dic,@"on":[NSString stringWithFormat:@"%ld",n],@"m":m}];


}

- (void)SelectionCellComponentType_Single:(SelectionCellFrame *)cellFrame{
    for (NSInteger i = 0; i < cellFrame.mArrRects.count; i ++) {
        NSDictionary *dic = (NSDictionary *)cellFrame.cellModel.dataList[i];
        
        UIView *view = [UIView new];
        UIImageView *IV = [UIImageView new];
        
        UILabel *rname = [Factory createLabelWithTitle:[HelperTools isBlankString:dic[@"rname"]] textColor:rnameColor fontSize:14.0f textAlignment:NSTextAlignmentLeft];
        UILabel *albumName = [Factory createLabelWithTitle:[HelperTools isBlankString:dic[@"des"]] textColor:albumNameColor fontSize:14.0f textAlignment:NSTextAlignmentLeft];
        UILabel *reportName = [Factory createLabelWithTitle:[dic[@"reportUrl"] firstObject] textColor:reportColor fontSize:14.0f textAlignment:NSTextAlignmentLeft];
        
        [IV sd_setImageWithURL:dic[@"pic"]];
        
        view.frame = [HelperTools withNSValue:cellFrame.mArrRects[i]];
        IV.frame = CGRectMake(0, 0, view.height, view.height);
        rname.frame = CGRectMake(IV.right + 10, IV.top + 5, view.width - IV.right - 10, (IV.height - 10)/3);
        albumName.frame = CGRectMake(rname.left, rname.bottom, rname.width, rname.height);
        
        CGFloat _y = (view.height - albumName.bottom - 25)/2;
        reportName.frame = CGRectMake(rname.left, albumName.bottom + _y, 60, 20);
        
        reportName.textAlignment = NSTextAlignmentCenter;
        reportName.layer.borderWidth = 1;
        reportName.layer.borderColor = reportColor.CGColor;
        
        [view addSubview:reportName];
        [view addSubview:albumName];
        [view addSubview:rname];
        [view addSubview:IV];
        [self addSubview:view];
    }
    

}

- (void)SelectionCellComponentType_Project:(SelectionCellFrame *)cellFrame{
    for (NSInteger i = 0; i < cellFrame.mArrRects.count; i ++) {
        NSDictionary *dic = (NSDictionary *)cellFrame.cellModel.dataList[i];
        
        UIImageView *IV = [UIImageView new];
        UILabel *label = [UILabel new];
        
        
        IV.frame = [HelperTools withNSValue:cellFrame.mArrRects[i]];
        label.frame = CGRectMake(IV.left, IV.bottom, IV.width, 30);
        
        [IV sd_setImageWithURL:dic[@"pic"]];
        label.text = dic[@"rname"];
        label.font = [UIFont systemFontOfSize:14.0f];
        label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:label];
        [self addSubview:IV];
    }
    
    DDLog(@"暂不做调试");

}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
