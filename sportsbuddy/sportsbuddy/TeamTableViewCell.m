//
//  TeamTableViewCell.m
//  sportsbuddy
//
//  Created by Wenting Shi on 7/27/14.
//  Copyright (c) 2014 Carnegie_Mellon. All rights reserved.
//

#import "TeamTableViewCell.h"

@implementation TeamTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
