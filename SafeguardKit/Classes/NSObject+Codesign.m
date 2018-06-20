//
//  NSObject+Codesign.m
//  004--防重签名
//
//  Created by H on 2018/6/12.
//  Copyright © 2018年 H. All rights reserved.
//

#import "NSObject+Codesign.h"

@implementation NSObject (Codesign)


void  checkCodesign(NSString *id){
    // 描述文件路径
    NSString *embeddedPath = [[NSBundle mainBundle] pathForResource:@"embedded" ofType:@"mobileprovision"];
    NSLog(@"Path:%@",embeddedPath);
    // 读取application-identifier  注意描述文件的编码要使用:NSASCIIStringEncoding
    NSString *embeddedProvisioning = [NSString stringWithContentsOfFile:embeddedPath encoding:NSASCIIStringEncoding error:nil];
    NSArray *embeddedProvisioningLines = [embeddedProvisioning componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
     NSLog(@"embeddedProvisioningLines:%@",embeddedProvisioningLines);
    for (int i = 0; i < embeddedProvisioningLines.count; i++) {
        if ([embeddedProvisioningLines[i] rangeOfString:@"application-identifier"].location != NSNotFound) {
            
            NSInteger fromPosition = [embeddedProvisioningLines[i+1] rangeOfString:@"<string>"].location+8;
            
            NSInteger toPosition = [embeddedProvisioningLines[i+1] rangeOfString:@"</string>"].location;
            
            NSRange range;
            range.location = fromPosition;
            range.length = toPosition - fromPosition;
            
            NSString *fullIdentifier = [embeddedProvisioningLines[i+1] substringWithRange:range];
            NSLog(@"%@", fullIdentifier);
            NSArray *identifierComponents = [fullIdentifier componentsSeparatedByString:@"."];
            NSString *appIdentifier = [identifierComponents firstObject];
            NSLog(@"%@", appIdentifier);
            // 对比签名ID
            if ([appIdentifier isEqual:id]) {
                NSUserDefaults *defaults  = [NSUserDefaults standardUserDefaults];
                [defaults setObject:appIdentifier forKey:@"key"];
                [defaults synchronize];
            }else{
                exit(0);
            }
            break;
        }
    }
}


@end
