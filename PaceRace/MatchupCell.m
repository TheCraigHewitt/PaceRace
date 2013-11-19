//
//  MatchupCell.m
//  Pace Race
//
//  Created by Craig Hewitt on 10/14/13.
//  Copyright (c) 2013 Craig Hewitt. All rights reserved.
//

#import "MatchupCell.h"

@implementation MatchupCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)awakeFromNib {
    [super awakeFromNib];
}
@end
