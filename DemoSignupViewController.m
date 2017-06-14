//
//  DemoSignupViewController.m
//  samens
//
//  Created by All time Support on 13/06/17.
//  Copyright © 2017 All time Support. All rights reserved.
//

#import "DemoSignupViewController.h"

@interface DemoSignupViewController ()

@end

@implementation DemoSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)ClickOnSignUp:(id)sender{
    
//    NSString *strUrl = [NSString stringWithFormat:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"];
//    NSURL *url = [NSURL URLWithString:strUrl];
//   
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    NSDictionary *reqDict=[NSDictionary dictionaryWithObjectsAndKeys:self.nameT.text,@"name",self.emailT.text,@"email",self.passwordT.text,@"password", nil];
//    NSError *error;
//    NSData *postData=[NSJSONSerialization dataWithJSONObject:reqDict options:NSJSONWritingPrettyPrinted error:&error];
//    [request setHTTPBody:postData];
//    
//    NSURLSessionConfiguration *config=[NSURLSessionConfiguration defaultSessionConfiguration];
//    [config setTimeoutIntervalForRequest:30.0];
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:config];
//    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSError *err;
//        id jsonObj=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
//        NSLog(@"%@",jsonObj);
//        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSLog(@"%@",jsonData);
//        
//    } ];
//    [task resume];
//    
//    NSURL *aUrl = [NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//    
//    [request setHTTPMethod:@"POST"];
//    NSString *postString = @"name=email=password";
//    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
//                                                                 delegate:self];

//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
//                                    initWithURL:[NSURL
//                                                 URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"]];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"text/json" forHTTPHeaderField:@"Content-type"];
//    
//    NSString *jsonString = [NSString stringWithFormat:@"{\n\"username\":\"%@\",\n\"%@\":\"%@\",\n\"%@\":\"%@\",}",_nameT, @"name",_passwordT,@"password",_emailT,@"email"];
//    
//    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
//    NSDictionary *headers = @{ @"content-type": @"multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
//                               @"cache-control": @"no-cache",
//                               @"postman-token": @"63b00724-6821-3eda-14f2-a94f36442213" };
//    NSArray *parameters = @[ @{ @"name": @"name", @"value": self.nameT.text },
//                             @{ @"name": @"email", @"value": self.emailT.text },
//                             @{ @"name": @"password", @"value":self.passwordT.text } ];
//    NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
//    
//    NSError *error;
//    NSMutableString *body = [NSMutableString string];
//    for (NSDictionary *param in parameters) {
//        [body appendFormat:@"--%@\r\n", boundary];
//        if (param[@"fileName"]) {
//            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"; filename=\"%@\"\r\n", param[@"name"], param[@"fileName"]];
//            [body appendFormat:@"Content-Type: %@\r\n\r\n", param[@"contentType"]];
//            [body appendFormat:@"%@", [NSString stringWithContentsOfFile:param[@"fileName"] encoding:NSUTF8StringEncoding error:&error]];
//            if (error) {
//                NSLog(@"%@", error);
//            }
//        } else {
//            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"\r\n\r\n", param[@"name"]];
//            [body appendFormat:@"%@", param[@"value"]];
//        }
//    }
//    [body appendFormat:@"\r\n--%@--\r\n", boundary];
//    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"]
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:10.0];
//    [request setHTTPMethod:@"POST"];
//    [request setAllHTTPHeaderFields:headers];
//    [request setHTTPBody:postData];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                    if (error) {
//                                                        NSLog(@"%@", error);
//                                                    } else {
//                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//                                                        NSLog(@"%@", httpResponse);
//                                                        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                                                        NSLog(@"%@",jsonData);
//                                                    }
//                                                }];
//    [dataTask resume];
    
//    
//    NSURL *aUrl = [NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php/"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:60.0];
//    
//    [request setHTTPMethod:@"POST"];
//    NSString *postString = @"name=name&email=email&password=password!";
//    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
//                                                                 delegate:self];

    
//    NSArray *keys = [NSArray arrayWithObjects: @"name",@"accountType",@"isOnline",@"username", nil];
//    NSArray *objects = [NSArray arrayWithObjects:name,[NSNumber numberWithBool:false],[NSNumber numberWithBool:false],userName, nil];
//    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
//    
//    NSString *myJSONString =[jsonDictionary ]
//    NSData *myJSONData =[myJSONString dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"myJSONString :%@", myJSONString);
//    NSLog(@"myJSONData :%@", myJSONData);
//    
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"]];
//    [request setHTTPBody:myJSONData];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
//    
//    
//    if (theConnection) {
//        NSLog(@"connected");
//        receivedData=[[NSMutableData alloc]init];
//    } else {
//        
//        NSLog(@"not connected");
//    }
//    
//}
    
//    
//    NSDictionary *headers = @{ @"content-type": @"multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
//                               @"cache-control": @"no-cache",
//                               @"postman-token": @"f41e6c75-e6c3-14c0-927d-3d34194205fc" };
//    NSArray *parameters = @[ @{ @"name": @"name", @"value": self.nameT.text },
//                             @{ @"name": @"email", @"value": self.emailT.text },
//                             @{ @"name": @"password", @"value": self.passwordT.text} ];
//    NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
//    
//    NSError *error;
//    NSMutableString *body = [NSMutableString string];
//    for (NSDictionary *param in parameters) {
//        [body appendFormat:@"--%@\r\n", boundary];
//        if (param[@"fileName"]) {
//            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"; filename=\"%@\"\r\n", param[@"name"], param[@"fileName"]];
//            [body appendFormat:@"Content-Type: %@\r\n\r\n", param[@"contentType"]];
//            [body appendFormat:@"%@", [NSString stringWithContentsOfFile:param[@"fileName"] encoding:NSUTF8StringEncoding error:&error]];
//            if (error) {
//                NSLog(@"%@", error);
//            }
//        } else {
//            [body appendFormat:@"Content-Disposition:form-data; name=\"%@\"\r\n\r\n", param[@"name"]];
//            [body appendFormat:@"%@", param[@"value"]];
//        }
//    }
//    [body appendFormat:@"\r\n--%@--\r\n", boundary];
//    NSData *postData = [body dataUsingEncoding:NSUTF8StringEncoding];
//    
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php"]
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:10.0];
//    [request setHTTPMethod:@"POST"];
//    [request setAllHTTPHeaderFields:headers];
//    [request setHTTPBody:postData];
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
//                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//                                                    if (error) {
//                                                        NSLog(@"%@", error);
//                                                    } else {
//                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
//                                                        NSLog(@"%@", httpResponse);
//                                                        id jsonData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                                                        NSLog(@"%@",jsonData);
//                                                    }
//                                                }];
//    [dataTask resume];
    
//    NSString *urlStr = @"http://samenslifestyle.com/samenslifestyle123.com/samens_mob/cust_register.php";
//    NSLog(@"%@",urlStr);
//    
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSLog(@"%@",url);
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    
//    NSError *err;
//    [request setHTTPBody:postData];
//    
//    
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (!error) {
//            id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//            NSLog(@"%@",obj);
//            
//
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//            });
//            
//        }else{
//            
//        }
//    }];
//    [task resume];
}

                                    



@end
