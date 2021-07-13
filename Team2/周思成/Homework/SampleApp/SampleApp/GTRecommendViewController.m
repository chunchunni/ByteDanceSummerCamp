//
//  GT RecommendViewController.m
//  SampleApp
//
//  Created by zsc on 2021/7/7.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>


@end

@implementation GTRecommendViewController


-(instancetype)init{
    self = [super init];
    if(self){
        //self.view.backgroundColor = [UIColor greenColor];
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon/like@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon/like_selected@2x.png"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.backgroundColor = [UIColor lightGrayColor];
    
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    
    //scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate  =self;
    NSArray *colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor lightGrayColor],[UIColor grayColor],[UIColor blueColor]];
    
    for (int i =0;i<5;i++){
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width*i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            
            [view addSubview:({
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
                tapGesture.delegate = self;
                [view addGestureRecognizer:tapGesture];
                
                view;
            })];
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    
    [self.view addSubview:scrollView];
    
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

-(void)viewClick{
    NSLog(@"TapGesture");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"scrollViewDidScroll - %@",@(scrollView.contentOffset.x));
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"BeginDragging");
    
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"EndDragging");
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
