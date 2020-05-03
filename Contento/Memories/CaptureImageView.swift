//
//  CaptureImageView.swift
//  Contento
//
//  Created by Sanchitha Dinesh on 4/11/20.
//  Copyright © 2020 hackathon. All rights reserved.
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
       // let predicate = NSPredicate(format: "mediaType == %i", PHAssetMediaType.video.rawValue)
        //fetchOptions.predicate = predicate
        fetchOptions.fetchLimit = 20
        
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
        
//        var img: UIImage?
//        let manager = PHImageManager.default()
//        let options = PHImageRequestOptions()
//        options.version = .original
//        options.isSynchronous = true
        let asset = fetchResult.object(at: index) as PHAsset
//        manager.requestImage(for: asset, options: options, targetSize: , contentMode: .aspectFit, options:) { data, _, _, _ in
//
//            if let data = data {
//                img = UIImage(data: data)
//            }
//        }
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
        
        // Note that if the request is not set to synchronous
        // the requestImageForAsset will return both the image
        // and thumbnail; by setting synchronous to true it
        // will return just the thumbnail
       // let requestOptions = PHImageRequestOptions()
       // requestOptions.isSynchronous = true
        
        // Perform the image request
//        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset, targetSize: CGSize(width: 3, height: 4), contentMode: PHImageContentMode.aspectFill, options: requestOptions, resultHandler: { (image, _) in
//                   return image
//            // If you haven't already reached the first
//            // index of the fetch result and if you haven't
//            // already stored all of the images you need,
//            // perform the fetch request again with an
//            // incremented index
////            if index + 1 < fetchResult.count && self.images.count < totalImageCountNeeded {
////                self.fetchPhotoAtIndex(index + 1, totalImageCountNeeded, fetchResult)
////            } else {
////                // Else you have completed creating your array
////                print("Completed array: \(self.images)")
////            }
//        })
        return nil
    }
}



