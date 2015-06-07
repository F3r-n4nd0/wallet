//
//  FLUWalletTableViewController.m
//  Wallet
//
//  Created by Fernando on 6/7/15.
//  Copyright (c) 2015 F3rn4nd0. All rights reserved.
//

#import "FLUWalletTableViewController.h"

#import "FLUWallet.h"

@interface FLUWalletTableViewController ()
@property (nonatomic, strong) FLUWallet *model;
@end

@implementation FLUWalletTableViewController

-(id) initWithModel:(FLUWallet*) model{
    
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.model.countCurrenty + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == self.model.countCurrenty + 1) {
        return 1;
    }
    return [self.model moneyWithCurrenty:[self.model.currentys objectAtIndex:section]].count;
}


@end
