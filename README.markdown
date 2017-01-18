# View Controller Container 範例

⚠️ 此 sample 沒有經過重構，旨在示範如何實作 view controller container 以及傳遞資料

請觀看 [commit 歷史](https://github.com/vc7/iOSViewControllerContainerSample/commits/master)

- `4f894ee`, `205964e` 建立需要顯示的 view controllers ，選取 cell 的時候會呼叫各自的 delegate method
- `e13a434` 把 view controllers 裝進主要的 view controller ，並透過 delegate 取得各自點擊到 row index

## 使用說明

- App 的第一畫面是 `ViewController.swift` 這個檔案的內容
- 當在畫面上點擊 cell 的時候，觸控事件的訊息會從被點擊到 table view 所在的 view controller ，透過各自的 delegate ，將事件傳到主要的 `ViewController` ，並在 console 印出訊息。

## 公開訊息

### View Controller Hierarchy

在 child view controller 的 view 被加入 container views 之前，會有一個方法被呼叫：

```
addChildViewController(<#A Child View Controller#>)
```

這個 method 會在完成加入 child view controller 之後，自動呼叫 child view controller 的這個 method ：

``` swift
willMove(toParentViewController: <#A Parent View Controller#>)
```

接著，把 view 加入 container 之後，可以讓 child view controller 執行這個 method ：

``` swift
didMove(toParentViewController: <#A Parent View Controller#>)
```

到這邊為止，才能說是完整。

要這樣做是因為在實作 parent-child view controller 的時候，如果沒有執行這行，會讓 view controller 的層級關係 (Hierarchy) 和 view 的層級關係不一致。

相對的，要移除這個 parent-child relationship 話，child view controller 就必須要執行這個 method ：

``` swift
removeFromParentViewController()
```

接著把 view 移出 container 之後，一樣也要讓 child view controller 知道已經移出 parent view controller 了，這時候只要把 parent view controller 設定成 nil 即可：

``` swift
didMove(toParentViewController: nil)
```

⚠️ 兩段式的原因

就可以在「加入」和「已加入完成」（及反向）之間，可以做到 view transitions ，或其他想要執行的商業邏輯。

### 手動加入 constraints

推薦使用這個 library -> [PureLayout/PureLayout](https://github.com/PureLayout/PureLayout) 

用了之後讓你五六行變一行、
用了之後會讓你考試也都會考一百分！