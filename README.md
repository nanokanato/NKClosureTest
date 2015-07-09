NKClosureTest
=============
http://nanoka.wpcloud.net  

テスト内容
-----
Swiftのクロージャ(Closure)で起動時処理後に通知するテスト  
  
・AppDelegateにてNKBootControllerを表示  
・AppDelegateにてNKBootControllerのクロージャ型の変数bootHandlerにクロージャ構文を設定  
・NKBootControllerにて起動時のアニメーション後bootHandlerに自身とBool型を返す  
・AppDelegateでNKBootControllerとBool型を受け取りNKViewController(ホーム画面)を表示