### WOMI Analytics Class
This class is build for easily tracking the Analytics events and session very easily without much code. Womi Analytics supports both the Apsalar (Used for Tracking Events) and Google Analytics. Single method to plug in both Analytics.

### INTEGRATION
#### STEP 1:
You must have both the Apsalar and Google Analytics SDK configured in your project. You can configure Apsalar from tutor [here](http://support.apsalar.com/customer/portal/articles/717510-integrating-the-ios-sdk) and Google Analytics SDK from the tutor [here](https://developers.google.com/analytics/devguides/collection/ios/v3/?configured).
NOTE : Even if you are using any one of there, you must configured both in your project.

#### STEP 2:
Once You configured, Download the Project on GitHub and  Copy the WomiAnalyticsiOS into your Project.

### USAGE :
#### Session Start -  Google Analytics
WomiAnalytics class is a singleton class. You can call all the methods by shared instance. 

Add this method at - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions to start the Google Analytics. No key is required as you have added the Google Configuration file while integrating Google Analytics SDK.

`-(void)startGoogleAnalytics;`

Eg:

`[[WomiAnalytics sharedManager] startGoogleAnalytics];`

#### Session Start - Google Analytics with Options
To start the Google Analytics Session with Exception Reporting Options, add this method instead of above method.
`-(void) startGoogleAnalyticsWithReportExceptions:(BOOL)catchExceptions;`

Eg:

`[[WomiAnalytics sharedManager] startGoogleAnalyticsWithReportExceptions:YES];`

#### Session Start -  Apsalar Session
To start the Apsalar Session, add this method at - (void)applicationDidBecomeActive:(UIApplication *)application

`- (void) startApsalarWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret;`

Eg:

`[[WomiAnalytics sharedManager] startApsalarWithAPIKey:@"YOUR_KEY" andSecret:@"SECRET"];`

#### Session Start - Apsalar Session with Java Script
If you use Java Scripts file in the App, use the following method to start the Apsalar Session. Use this method in - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation

`- (void)startApsalarJSWithAPIKey:(NSString *)apiKey andSecret:(NSString *)secret;`

Eg:

[[WomiAnalytics sharedManager] startApsalarWithAPIKey:@"YOUR_KEY" andSecret:@"SECRET"];`

#### Basic Event Tracking for Womi Games 

The events predefined are 

`- (void)eventAppOpen;`

`- (void)eventGameStarts;`

`- (void)eventGameComplete;`

`- (void)eventGameCompleteWithScore:(NSString *)score;`

`- (void)eventDailyBonus;`

`- (void)eventHighScoreBonus;`

`- (void)eventHighScoreBonusWithScore:(NSString *)score;`

`- (void)eventPortalLaunch;`

`- (void)eventAppPopup;`

Eg:

`[[WomiAnalytics sharedManager] eventAppOpen];`

`[[WomiAnalytics sharedManager] eventHighScoreBonusWithScore:@"256"];`

#### Custom Event Tracking

Other than the basic event for games, custom events can be tracked by using the method
`- (void)eventCustomName:(NSString *)event category:(NSString *)category label:(NSString *)label value:(NSString *)value;`

Eg:

`[[WomiAnalytics sharedManager] eventCustomName:@"tapped_help" category:@"ui_action" label:nil value:nil];`

NOTE : Event Name, and Category name is must for this method. Label and Value is optional. 

#### Screen tracking
The Screen Tracking is available natively in Google Analytics, and added to the Apsalar as an even with secondary Argument "screen_event"

To track the screen, pass the name of the screen to this method.
`- (void)screenName:(NSString *)screenName`

Eg:

`[[WomiAnalytics sharedManager] screenName:@"Game_Screen"]`

