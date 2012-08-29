//
//  BBAppDelegate.m
//  Recipes
//
//  Created by Martin Volerich on 8/29/12.
//  Copyright (c) 2012 Bill Bear. All rights reserved.
//

#import "BBAppDelegate.h"
#import "BBRecipe.h"
#import "BBRecipesListViewController.h"

@implementation BBAppDelegate

- (NSArray *)recipes
{
    if (nil == _recipes) {
        NSMutableArray *recipes = [NSMutableArray array];
        
        for (int i = 0; i < 6; i++) {
            BBRecipe *recipe = [[BBRecipe alloc] init];
            recipe.directions = [NSString stringWithFormat:@"%d - Put some stuff in, and the other stuff, then stir.", i];
            recipe.title = [NSString stringWithFormat:@"%d - One Fine Food", i];
            recipe.image = [UIImage imageNamed:@"cookies.png"];
            [recipes addObject:recipe];
        }
        
        NSString *directions = @"Put the flour and other dry ingredients in a bowl,\
        stir in the egs until evenly moust. Add chocolate chips and stir until event. \
        Place tablespoon-size portions on greased cookie sheet and bake at 350∘ for \
        6 minutes.";
        BBRecipe *recipe = [[BBRecipe alloc] init];
        recipe.title = @"Chocolate Chip Cookies";
        recipe.image = [UIImage imageNamed:@"cookies.png"];
        recipe.directions = directions;
        [recipes addObject: recipe];
        _recipes = [recipes copy];
    }
    return _recipes;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[BBRecipesListViewController alloc] initWithNibName:@"BBRecipesListViewController" bundle:nil];
    
    self.window.rootViewController = self.viewController;
    self.viewController.recipes = self.recipes;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
