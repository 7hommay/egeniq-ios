//
//  SwitchTableViewCell.m
//  AxisControl
//
//  Created by Peter Verhage on 17-11-10.
//  Copyright 2010 Egeniq. All rights reserved.
//

#import "EFSliderSpecifierCell.h"

@implementation EFSliderSpecifierCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithReuseIdentifier:reuseIdentifier]) != nil) {
		self.textLabel.hidden = YES;
		self.detailTextLabel.hidden = YES;
		valueField = [[UISlider alloc] init];	
		[self.contentView addSubview:valueField];
    }
	
    return self;
}

- (float)minimumValue {
	return valueField.minimumValue;
}

- (void)setMinimumValue:(float)value {
	valueField.minimumValue = value;
	[self setNeedsLayout];
}

- (float)maximumValue {
	return valueField.maximumValue;
}

- (void)setMaximumValue:(float)value {
	valueField.maximumValue = value;
	[self setNeedsLayout];
}

- (float)value {
	return valueField.value;
}

- (void)setValue:(float)value {
	valueField.value = value;
	[self setNeedsLayout];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	CGRect valueFrame = valueField.frame;
	valueFrame.size.width = self.contentView.frame.size.width - 20.0;
	valueFrame.origin.x = 10.0;
	valueFrame.origin.y = (self.contentView.frame.size.height - valueFrame.size.height) / 2;
	valueField.frame = valueFrame;
}

- (void)dealloc {
	[valueField release];
	valueField = nil;
	
    [super dealloc];
}

@end