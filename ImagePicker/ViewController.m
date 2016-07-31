//
//  ViewController.m
//  ImagePicker
//
//  Created by Rajesh on 15/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize imageViewPicture,imagePath;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //initialize image path
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    imagePath=[NSString stringWithFormat:@"%@/profile.png",[pathArray objectAtIndex:0]];
    
    //show the image stored in App's documents folder after loading of the app
    imageViewPicture.image=[UIImage imageWithContentsOfFile:imagePath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ActionPickImage:(id)sender
{
    UIImagePickerController *imageCon=[[UIImagePickerController alloc]init];
    
    //set gallery as image src
    imageCon.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    //set delegate
    imageCon.delegate = self;
    imageCon.allowsEditing = true;
    
    //show the controller
    [self presentViewController:imageCon animated:true completion:nil];
}

//methods from delegate to receive selected image
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *pickedImage=[info objectForKey:UIImagePickerControllerEditedImage]; //info is object of Dictionary here
    
    imageViewPicture.image = pickedImage;
    
    //close image picker controller
    [picker dismissViewControllerAnimated:true completion:nil];
    
    //save picked image at image path
    NSData *imageData=UIImagePNGRepresentation(pickedImage);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager createFileAtPath:imagePath contents:imageData attributes:nil];
    
    NSLog(@"Image Path:%@",imagePath);
}
@end
