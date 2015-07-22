//
//  WomiAnalytics.m
//  WomiAnalytics
//
//  Created by Ranjith on 15/07/15.
//  Copyright (c) 2015 WomiStudios. All rights reserved.
//

#import "WomiAnalytics.h"

@implementation WomiAnalytics{
    BOOL isApsalar;
    BOOL isGoogleAnalytics;
    BOOL isFlurry;
}

static WomiAnalytics *sharedDelegate = nil;


#pragma mark - Singleton Methods
+ (id)sharedManager {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if (sharedDelegate == nil) {
            sharedDelegate = [[self alloc] init];
        }
    });
    return sharedDelegate;
}

- (id) init {
    if (self = [super init]) {
        [self initValues];
    }
    return self;
}

- (void)initValues{
    isGoogleAnalytics = NO;
    isApsalar = NO;
}

#pragma mark - Apsalar Methods

-(void)startApsalarWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret{
    isApsalar = YES;
    [Apsalar startSession:apiKey withKey:secret];
}

-(void)startApsalarJSWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret{
    isApsalar = YES;
    [Apsalar startSession:apiKey withKey:secret];
}

#pragma mark - Google Analytics Method

- (void) startGoogleAnalytics{
    isGoogleAnalytics = YES;
    // Configure tracker from GoogleService-Info.plist.
    NSError *configureError;
    [[GGLContext sharedInstance] configureWithError:&configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
}

- (void) startGoogleAnalyticsWithReportExceptions:(BOOL)catchExceptions{
    isGoogleAnalytics = YES;
    // Configure tracker from GoogleService-Info.plist.
    NSError *configureError;
    [[GGLContext sharedInstance] configureWithError:&configureError];
    NSAssert(!configureError, @"Error configuring Google services: %@", configureError);
    
    // Optional: configure GAI options.
    GAI *gai = [GAI sharedInstance];
    gai.trackUncaughtExceptions = catchExceptions;  // report uncaught exceptions
}

#pragma mark - Flurry Analytics

- (void)startFlurryWithAPIKey:(NSString *)apiKey{
    isFlurry = YES;
    [Flurry startSession:apiKey];
}


#pragma mark - Event Tracking

-(void)eventAppOpen{
    if (isApsalar) {
        [Apsalar event:@"app_open"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"user_action"     // Event category (required)
                                                              action:@"app_open"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"app_open"];
    }
}

-(void)eventAppPopup{
    if (isApsalar) {
        [Apsalar event:@"app_popup"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"game_action"     // Event category (required)
                                                              action:@"app_popup"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"app_popup"];
    }
}

-(void)eventDailyBonus{
    if (isApsalar) {
        [Apsalar event:@"daily_app_bonus"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"appsaholic_action"     // Event category (required)
                                                              action:@"daily_app_bonus"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"daily_app_bonus"];
    }
}

-(void)eventGameComplete{
    if (isApsalar) {
        [Apsalar event:@"game_complete"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"user_action"     // Event category (required)
                                                              action:@"game_complete"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"game_complete"];
    }
}

-(void)eventGameCompleteWithScore:(NSString *)score{
    NSDictionary *dict = @{
                           @"score" : score
                           };
    if (isApsalar) {
        [Apsalar event:@"game_complete" withArgs:dict];
    }
    if (isGoogleAnalytics) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"user_action"     // Event category (required)
                                                              action:@"game_complete"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:[NSNumber numberWithInteger:[score integerValue]]] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"game_complete" withParameters:dict];
    }
}

-(void)eventGameStarts{
    if (isApsalar) {
        [Apsalar event:@"game_starts"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"user_action"     // Event category (required)
                                                              action:@"game_starts"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    if (isFlurry) {
        [Flurry logEvent:@"game_starts"];
    }
}

-(void)eventHighScoreBonus{
    if (isApsalar) {
        [Apsalar event:@"highscore_app_bonus"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"appsaholic_action"     // Event category (required)
                                                              action:@"highscore_app_bonus"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    
    if (isFlurry) {
        [Flurry logEvent:@"highscore_app_bonus"];
    }
}

- (void)eventHighScoreBonusWithScore:(NSString *)score{
    NSDictionary *dict = @{
                           @"score" : score
                           };
    if (isApsalar) {
        [Apsalar event:@"highscore_app_bonus" withArgs:dict];
    }
    if (isGoogleAnalytics) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"appsaholic_action"     // Event category (required)
                                                              action:@"highscore_app_bonus"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:[NSNumber numberWithInteger:[score integerValue]]] build]];    // Event value
    }
    
    if (isFlurry) {
        [Flurry logEvent:@"highscore_app_bonus" withParameters:dict];
    }
}

-(void)eventPortalLaunch{
    if (isApsalar) {
        [Apsalar event:@"portal_launch"];
    }
    if (isGoogleAnalytics) {
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"appsaholic_action"     // Event category (required)
                                                              action:@"portal_launch"  // Event action (required)
                                                               label:nil          // Event label
                                                               value:nil] build]];    // Event value
    }
    
    if (isFlurry) {
        [Flurry logEvent:@"portal_launch"];
    }
}

-(void)eventCustomName:(NSString *)event category:(NSString *)category label:(NSString *)label value:(NSString *)value{
    
    NSString *labelTemp = @"";
    NSString *valueTemp = @"";
    if (label != nil) {
        labelTemp = label;
    }
    if (value != nil) {
        valueTemp = value;
    }
    NSDictionary *dict = @{
                           @"category" : category,
                           @"label" : labelTemp,
                           @"value" : valueTemp
                           };
    
    if (isApsalar) {
        if (event != nil && category != nil) {
            [Apsalar event:event withArgs:dict];
        }
    }
    
    if (isGoogleAnalytics) {
        if (event != nil && category != nil) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:category     // Event category (required)
                                                              action:event  // Event action (required)
                                                               label:label          // Event label
                                                               value:[NSNumber numberWithInteger:[value integerValue]]] build]];    // Event value
        }
    }
    
    if (isFlurry) {
        [Flurry logEvent:event withParameters:dict];
    }
}

- (void)screenName:(NSString *)screenName{
    if (isApsalar) {
        [Apsalar eventWithArgs:screenName,@"screen_event"];
    }
    if (isGoogleAnalytics) {
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        [tracker set:kGAIScreenName value:screenName];
        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    }
    if (isFlurry) {
        NSDictionary *dict = @{
                               @"screen_name" : screenName
                               };
        [Flurry logEvent:@"screen_event" withParameters:dict];
    }
}

@end
