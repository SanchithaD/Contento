//
//  CaptureImageView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/11/20.
//  Copyright © 2020 Sanchitha Dinesh. All rights reserved.
//

import SwiftUI
import Photos
import PhotosUI
struct Memory: View {
    
    @State var photoIndex: Int = 0
    var body: some View {
        VStack {
            AppTitleView(Title: "Today's Special Memories")
            HStack {
            PhotoPicker()
                .frame(width: 120, height: 90)
                .clipped()
            PhotoPicker()
                .frame(width: 120, height: 90)
                .clipped()
            PhotoPicker()
            .frame(width: 120, height: 90)
                .clipped()
            }
            HStack{
                PhotoPicker()
                    .frame(width: 120, height: 90)
                    .clipped()
                PhotoPicker()
                    .frame(width: 120, height: 90)
                    .clipped()
                PhotoPicker()
                .frame(width: 120, height: 90)
                .clipped()
            }
            HStack{
                PhotoPicker()
                    .frame(width: 120, height: 90)
                    .clipped()
                PhotoPicker()
                    .frame(width: 120, height: 90)
                    .clipped()
                PhotoPicker()
                .frame(width: 120, height: 90)
                .clipped()
            }
        }
    }
}
struct PhotoPicker: UIViewRepresentable
{
    typealias UIViewType = UIImageView
    @State var photoIndex: Int = 0
    func makeUIView(context: Context) -> UIImageView {
        let photo = UIImageView()
        return photo
    }
    func updateUIView(_ uiView: UIImageView, context: Context) {
        let image = fetchPhotos(photoIndex: photoIndex)
        uiView.frame = CGRect.init(x: 0, y: 0, width: 5, height: 5)
        uiView.image = image
    }
    
    
    var images:[UIImage] = []
    
    func fetchPhotos (photoIndex: Int) -> UIImage? {
        // Sort the images by descending creation date and fetch the first 3
        let status = PHPhotoLibrary.authorizationStatus()
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        fetchOptions.fetchLimit = 10000
        
        // Fetch the image assets
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        // If the fetch result isn't empty,
        // proceed with the image request
        if fetchResult.count > 0 {
            let totalImageCountNeeded = 1 // <-- The number of images to fetch
            let randomIndex = Int.random(in: 0 ..< fetchResult.count)
            
            //let fetchImage = fetchResult.objects()
            return fetchPhotoAtIndex(randomIndex, totalImageCountNeeded, fetchResult)
        }
        
        return nil
    }
    
    // Repeatedly call the following method while incrementing
    // the index until all the photos are fetched
    func fetchPhotoAtIndex(_ index:Int, _ totalImageCountNeeded: Int, _ fetchResult: PHFetchResult<PHAsset>) -> UIImage? {
        let asset = fetchResult.object(at: index) as PHAsset
        let requestOptions = PHImageRequestOptions()
        requestOptions.resizeMode = PHImageRequestOptionsResizeMode.fast
        requestOptions.deliveryMode = PHImageRequestOptionsDeliveryMode.highQualityFormat
        requestOptions.isNetworkAccessAllowed = true
        requestOptions.isSynchronous = true
        var image: UIImage?
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 400, height: 300), contentMode: PHImageContentMode.aspectFit, options: requestOptions, resultHandler: { (currentImage, info) in
            image = currentImage
        })
        return image
    }
}



