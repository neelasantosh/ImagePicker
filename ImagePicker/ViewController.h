//
//  ViewController.h
//  ImagePicker
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageViewPicture;

- (IBAction)ActionPickImage:(id)sender;

@property NSString *imagePath;

@end

