//
//  ViewController.m
//  cameraRemote
//
//  Created by 長尾 聡一郎 on 2015/05/16.
//  Copyright (c) 2015年 長尾 聡一郎. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)UIImagePickerController* pickerCtr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showUIImagePicker];
}

- (void)showUIImagePicker
{
    // カメラが使用可能かどうか判定する
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return;
    }
    
    // UIImagePickerControllerのインスタンスを生成
    self.pickerCtr = [[UIImagePickerController alloc] init];
    
    // デリゲートを設定
    self.pickerCtr.delegate = self;
    
    // 画像の取得先をカメラに設定
    self.pickerCtr.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    // 画像取得後に編集するかどうか（デフォルトはNO）
    self.pickerCtr.allowsEditing = YES;
    
    // 撮影画面をモーダルビューとして表示する
    [self presentViewController:self.pickerCtr animated:YES completion:nil];
}

-(void)takePicture
{
    //　写真を撮る
    [self.pickerCtr takePicture];
}

// 画像が選択された時に呼ばれるデリゲートメソッド
- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    // モーダルビューを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // 渡されてきた画像をフォトアルバムに保存
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(targetImage:didFinishSavingWithError:contextInfo:), NULL);
}

// 画像の選択がキャンセルされた時に呼ばれるデリゲートメソッド
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // モーダルビューを閉じる
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // キャンセルされたときの処理を記述・・・
}

// 画像の保存完了時に呼ばれるメソッド
- (void)targetImage:(UIImage *)image
didFinishSavingWithError:(NSError *)error
        contextInfo:(void *)context
{
    if (error) {
        // 保存失敗時の処理
    } else {
        // 保存成功時の処理
    }
}

@end
