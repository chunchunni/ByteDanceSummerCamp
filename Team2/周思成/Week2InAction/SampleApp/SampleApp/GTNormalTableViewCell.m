//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by zsc on 2021/7/8.
//

#import "GTNormalTableViewCell.h"


@interface GTNormalTableViewCell()

@property(nonatomic ,strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *commentLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;

@property(nonatomic, strong, readwrite) UIImageView *rightimageView;

@property(nonatomic, strong, readwrite) UIButton *deleteButton;



@end



@implementation GTNormalTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            //self.titleLabel.backgroundColor = [UIColor redColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            //self.sourceLabel.backgroundColor = [UIColor redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
           // self.commentLabel.backgroundColor = [UIColor redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            //self.timeLabel.backgroundColor = [UIColor redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightimageView = [[UIImageView alloc] initWithFrame:CGRectMake(280 , 15, 70, 70)];
            //self.rightimageView.backgroundColor = [UIColor redColor];
            self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightimageView;
        })];
        [self.contentView addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(260 , 80, 30, 20)];
            self.deleteButton.backgroundColor = [UIColor blueColor];
//            self.deleteButton.contentMode = UIViewContentModeScaleAspectFit;
            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
        
    }
    return self;
}

-(void) layoutTableViewCell{
    self.titleLabel.text = @"IOS开发";
    
    self.sourceLabel.text = @"IOS开发";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"233评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"3分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightimageView.image = [UIImage imageNamed:@"icon/page@2x.png"];
}

-(void)deleteButtonClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"是否要删除" message:@"请点击“是”确认" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *conform = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了是按钮");
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了否按钮");
    }];
    
    [alert addAction:conform];
    [alert addAction:cancel];
    
    id object = self;
    while (![object isKindOfClass:[UIViewController class]]) {
        object = [object nextResponder];
    }
    // nextPresponder 方法来可类似获取上一级的类
    UIViewController *vc = (UIViewController *)object;
    [vc presentViewController:alert animated:YES completion:nil];
    
}

@end
