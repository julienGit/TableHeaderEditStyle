//
//  AppDelegate.h
//  HeaderStyleSheet
//
//  Created by zouyou on 2017/9/7.
//  Copyright © 2017年 zouyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

