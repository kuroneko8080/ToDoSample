//
//  TDSCreateItemViewController.m
//  ToDoSample
//
//  Created by tron on 2014/12/13.
//  Copyright (c) 2014年 Sleeping Cat Syndrome. All rights reserved.
//

#import "TDSCreateItemViewController.h"

@implementation TDSCreateItemViewController

- (IBAction)cancelButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(createItemViewControllerDidFinish:item:)]) {
        [self.delegate createItemViewControllerDidCancel:self];
    }
}

- (IBAction)saveButtonTapped:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(createItemViewControllerDidCancel:)]) {
        [self.delegate createItemViewControllerDidFinish:self item:self.textField.text];
    }
}

@end

