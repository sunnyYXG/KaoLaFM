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
    
    UILabel *title = [[UILabel alloc]initWithFrame:cellFrame.titleRect];
    title.text = cellFrame.cellModel.name;
    
    UIView *line = [[UIView alloc]initWithFrame:cellFrame.lineRect];
    line.backgroundColor = UIColorFromRGB(248, 248, 248);
    [self addSubview:line];

    if (cellFrame.componentType == SelectionCellComponentType_Three || cellFrame.componentType == SelectionCellComponentType_Single) {
        [self addSubview:title];
        
        for (NSInteger i = 0; i < cellFrame.mArrRects.count; i ++) {
            NSDictionary *dic = (NSDictionary *)cellFrame.cellModel.dataList[i];
            NSString *string = dic[@"albumName"];

            if (cellFrame.componentType == SelectionCellComponentType_Single) {
                string = dic[@"des"];
            }
            UIView *view = [UIView new];
            UIImageView *IV = [UIImageView new];
            UILabel *rname = [Factory createLabelWithTitle:dic[@"rname"] textColor:[UIColor blueColor] fontSize:14.0f textAlignment:NSTextAlignmentLeft];
            UILabel *albumName = [Factory createLabelWithTitle:string textColor:[UIColor orangeColor] fontSize:14.0f textAlignment:NSTextAlignmentLeft];
            
            [IV sd_setImageWithURL:dic[@"pic"]];
            rname.numberOfLines = 2;
            albumName.numberOfLines = 1;
            
            view.frame = [HelperTools withNSValue:cellFrame.mArrRects[i]];
            IV.frame = CGRectMake(0, 0, view.width, view.width);
            rname.frame = CGRectMake(IV.left, IV.bottom, IV.width, view.height - view.width - 20);
            albumName.frame = CGRectMake(IV.left, rname.bottom, IV.width, 20);
            
//            [IV mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.left.equalTo(view.mas_left);
//                make.top.equalTo(view.mas_top);
//                make.width.and.height.mas_equalTo(view.mas_width);
//
//            }];
//
//            view.backgroundColor = [UIColor lightGrayColor];

            [view addSubview:albumName];
            [view addSubview:rname];
            [view addSubview:IV];
            [self addSubview:view];
        }
    }else if(cellFrame.componentType == SelectionCellComponentType_Project){
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
    }else{
        [self addSubview:title];

    }
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
