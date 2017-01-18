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

在加入 containers 之前，會有一個方法被呼叫：

```
willMove(toParentViewController:<#A Parent View Controller#>)
```

是因為在實作 parent-child view controller 的時候，如果沒有執行這行，會破壞 view controller 的層級關係 (Hierarchy)。

相對的，要移除這個 parent-child relationship 話，就必須要執行這個 method ：

```
removeFromParentViewController()
```

### 手動加入 constraints

推薦使用這個 library -> [PureLayout/PureLayout](https://github.com/PureLayout/PureLayout) 

用了之後讓你五六行變一行、
用了之後會讓你考試也都會考一百分！