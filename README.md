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


References
------------
* [Xib - Runtime error (1) - ](https://ja.stackoverflow.com/questions/215/xcode6%E8%87%AA%E4%BD%9C%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E3%83%AF%E3%83%BC%E3%82%AF%E5%86%85%E3%81%A7xib%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B%E3%81%A8could-not-load-nib-in-bundle-%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%8C%E7%99%BA%E7%94%9F%E3%81%99%E3%82%8B)
 
* [Xib - Runtime error (2) - ](http://d.hatena.ne.jp/laynts/20120209/1328752756)
 
* [UIView x Xib](http://qiita.com/iKichiemon/items/3cfa6c2bf2a0acb299a0)
