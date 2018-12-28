# DJEmptyView
Add an empty view to your table view with one line of codes.

![](https://github.com/iwufan/Resources/blob/master/Images/DJEmptyView/example1.gif)

### Main Features!
- Add an empty view to a table view or a view.
### How To Install?
##### Manual
Just drag the `DJEmptyView` folder to your project. 
##### Cocoapods
`pod 'DJEmptyView'`

You should also import this framework before you use it, like this `import DJEmptyView`.
### How to use DJEmptyView?
It's very simple. only one function you should. In your loadData function, you can just do this.
```
if dataArray.count == 0 && self.pageNumber == 1 {
    self.tableView.dj_showEmptyView(DJEmptyView(tipInfo: "暂无相关数据", imageName: "img_no_data"))
} else {
    self.tableView.dj_hideEmptyView()
}
```
### Note:
You can download the demo for example codes.
### License
MIT
### Contact Me
[悟饭哪](https://www.jianshu.com/u/819830158b47)

#### Thanks
