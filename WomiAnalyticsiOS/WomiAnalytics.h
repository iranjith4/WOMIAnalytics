//
//  WomiAnalytics.h
//  WomiAnalytics
//
//  Created by Ranjith on 15/07/15.
//  Copyright (c) 2015 WomiStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Apsalar.h"
#import <Google/Analytics.h>

@interface WomiAnalytics : NSObject

+ (id)sharedManager;

//Inititalization Methods

/*
 * Start Apsalar method for general apps
 * Use this method in - (void)applicationDidBecomeActive:(UIApplication *)application
 */
- (void) startApsalarWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret;

/*
 * Start the Apsalar Session, with the Java Script
 * Use this method in - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
 */
- (void)startApsalarJSWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret;

/*
 * Start Google Analytics with basic configurations
 * add this at applicationDidFinishLaunchWithOptions
 */
- (void)startGoogleAnalytics;

/*
 * Start Google Analytics with Options
 * add this at - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 */
- (void) startGoogleAnalyticsWithReportExceptions:(BOOL)catchExceptions;


// Game Events - Womi Studios

- (void)eventAppOpen;

- (void)eventGameStarts;

- (void)eventGameComplete;

- (void)eventGameCompleteWithScore:(NSString *)score;

- (void)eventDailyBonus;

- (void)eventHighScoreBonus;

- (void)eventHighScoreBonusWithScore:(NSString *)score;

- (void)eventPortalLaunch;

- (void)eventAppPopup;

// Custom Events

/*
 * Event Name and the Category Name is must. Otheres are optional.
 */
- (void)eventCustomName:(NSString *)event category:(NSString *)category label:(NSString *)label value:(NSString *)value;

// Screen Capturing

- (void)screenName:(NSString *)screenName;

@end
