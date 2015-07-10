NKClosureTest
=============
http://nanoka.wpcloud.net  

テスト内容
-----
Swiftのクロージャ(Closure)で起動時処理後に通知するテスト  
  
・AppDelegateにてNKBootControllerを初期化、クロージャ構文を引数としてクロージャ型の変数を渡す。  
・AppDelegateにてNKBootControllerを表示  
・NKBootControllerにて起動時のアニメーション後bootHandlerに自身とBool型を返す  
・AppDelegateでNKBootControllerとBool型を受け取りNKViewController(ホーム画面)を表示