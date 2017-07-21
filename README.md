# ViewFromXib

Abstract
============
* .xib(nib) file used from UIViewController.
* UIViewControllerから.xibファイルを読み込んでUIViewとして利用するコードです。

Writing
------------
* Swift 3
* Xcode ver. 8.3.3


Highlight
------------
* ViewController.view(self.view) include both nib view(created by .xib file) and code view(code in UIViewController).
* if CountUpButton(by code) tapped, count up for UILabel(in nib view).
* ViewController内にコードで書かれたViewと.xibのViewを共存させます。
* コードで書かれたボタンを押すことで.xibで作成したラベルのテキストを更新します。


Target
------------
* main view created by code(no use Storyboard), and add partially .xib files.
* 基本的にStoryboard不使用で，一部のみxibでの利用をしたい方へ。


Sample working window
------------
![iPad sample working view](https://github.com/YutoMizutani/ViewFromXib/blob/master/sampleWindow.png)
