module.exports = {
  publicPath: process.env.NODE_ENV === 'production' ? './' : '/',
  pluginOptions: {
    electronBuilder: {
      nodeIntegration: true,
      builderOptions: {
        appId: 'com.vincent.electron-builder',
        productName: 'ElectronBuilderDemo',
        copyright: 'Copyright © 2020 electron-builder Demo',
        win: {
          target: [
            // 'nsis', // 打包为nsis安装文件
          ]
        },
        // nsis: {
        //   language: "1041",
        //   unicode: true,
        //   oneClick: false, // 是否一键安装
        //   perMachine:true,
        //   script:"./scripts/SmartConnect.nsi",
        //   allowToChangeInstallationDirectory: true, // 允许用户选择安装位置
        //   installerIcon: "./scripts/icon.ico",// 安裝圖標
        //   uninstallerIcon: "./scripts/icon.ico",//卸載圖標
        //   installerHeaderIcon: "./scripts/icon.ico", // 安裝時頭部圖標
        //   createDesktopShortcut: true, // 創建桌面圖標
        //   createStartMenuShortcut: true,// 創建開始菜單圖標
        //   shortcutName: "xxxx", // 圖標名稱
        // },
        publish: [
          {
            provider: 'generic',
            url: 'http://219.135.99.136/download'
          }
        ]
      }
    }
  }
}
