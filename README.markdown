# View Controller Container 範例

⚠️ 此 sample 沒有經過重構，旨在示範如何實作 view controller container 以及傳遞資料

請觀看 [commit 歷史](https://github.com/vc7/iOSViewControllerContainerSample/commits/master)

- `4f894ee`, `205964e` 建立需要顯示的 view controllers ，選取 cell 的時候會呼叫各自的 delegate method
- `e13a434` 把 view controllers 裝進主要的 view controller ，並透過 delegate 取得各自點擊到 row index