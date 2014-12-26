//
//  TDSCreateItemViewController.h
//  ToDoSample
//
//  Created by tron on 2014/12/13.
//  Copyright (c) 2014年 Sleeping Cat Syndrome. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDSCreateItemViewControllerDelegate;

@interface TDSCreateItemViewController : UITableViewController

@property (weak, nonatomic) id<TDSCreateItemViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancelButtonTapped:(id)sender;
- (IBAction)saveButtonTapped:(id)sender;

@end

/**
 *  TDSCreateItemViewControllerDelegate
 */
@protocol TDSCreateItemViewControllerDelegate <NSObject>
// delegate method for "Save"
- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item;
// delegate method for "Cancel"
- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller;
@end