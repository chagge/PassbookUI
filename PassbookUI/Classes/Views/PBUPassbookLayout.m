//
//  PBUPassbookLayout.m
//  PassbookUI
//
//  Created by huin on 2014/03/03.
//  Copyright (c) 2014年 huin.me. All rights reserved.
//

#import "PBUPassbookLayout.h"

@interface PBUPassbookLayout()

@end

@implementation PBUPassbookLayout

- (CGSize)collectionViewContentSize
{
    CGSize size = self.collectionView.bounds.size;
    UIEdgeInsets inset = self.collectionView.contentInset;
    size.height -= (inset.top + inset.bottom - 1.0);

    return size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

- (void)prepareLayout
{
    [super prepareLayout];
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];

    NSInteger sections = self.collectionView.numberOfSections;
    for (int section = 0; section < sections; ++section) {
        NSInteger items = [self.collectionView numberOfItemsInSection:section];
        for (int idx = 0; idx < items; ++idx) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:section];
            UICollectionViewLayoutAttributes *attribute;
            attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
            [attributes addObject:attribute];
        }
    }

    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger items = [self.collectionView numberOfItemsInSection:indexPath.section];

    UICollectionViewLayoutAttributes *attributes;
    attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    CGFloat hPadding = 4.0f;
    // size
    attributes.size = CGSizeMake(CGRectGetWidth(self.collectionView.bounds) - hPadding,
                                 400.0f);

    // frame
    CGRect frame = CGRectZero;
    frame.origin.x = hPadding/2;
    frame.origin.y = ([self collectionViewContentSize].height/items) * indexPath.row;
    frame.size = attributes.size;
    attributes.frame = frame;

    // alpha
    attributes.alpha = 1.0f;

    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind
                                                                     atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind
                                                                  atIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end