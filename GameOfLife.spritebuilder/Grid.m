//
//  Grid.m
//  GameOfLife
//
//  Created by Ruben Ascencio on 6/28/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"


static const int GridRows = 8;
static const int GridColumns = 10;

@implementation Grid {
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
}

- (void)onEnter
{
    [super onEnter];
    [self setupGrid];

    self.userInteractionEnabled = YES;
}

- (void)setupGrid
{
    _cellWidth = self.contentSize.width / GridColumns;
    _cellHeight = self.contentSize.height / GridRows;

    float x = 0;
    float y = 0;

    _gridArray = [NSMutableArray array];

    for (int i = 0; i < GridRows; i++) {

        _gridArray[i] = [NSMutableArray array];
        x = 0;

        for (int j = 0; j < GridColumns; j++) {
            Creature *creature = [[Creature alloc] initCreature];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            [self addChild:creature];

            _gridArray[i][j] = creature;

            x += _cellWidth;
        }

        y += _cellHeight;
    }
}

@end
