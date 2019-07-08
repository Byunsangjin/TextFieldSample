//
//  ViewController.m
//  TextFieldSample
//
//  Created by Byunsangjin on 08/07/2019.
//  Copyright © 2019 Byunsangjin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonTouched:(id)sender {
    NSNumber *number = [NSNumber numberWithDouble:[self.textField.text doubleValue]];
    self.numberLabel.text = [NSString stringWithFormat:@"%@", number];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"."]) {
        return [textField.text containsString:@"."] ? NO : YES;
    }
    
    NSString *str;
    if (range.length == 0) { // 입력 시
        str = [NSString stringWithFormat:@"%@%@", textField.text, string];
    } else { // 지울 때
        return YES;
    }
    
    if (![str containsString:@"."]) { // 정수부
        return str.length > 3 ? NO : YES;
    } else { // 소수부
        NSRange range = [str rangeOfString:@"."];
        NSString *integer = [str substringWithRange:NSMakeRange(0, range.location + 1)];
        NSString *decimal = [str stringByReplacingOccurrencesOfString:integer withString:@""];
        
        return decimal.length > 2 ? NO : YES;
    }
    
    return YES;
}


@end
