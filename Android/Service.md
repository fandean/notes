# Android Service

官方教程：[服务 - Android Developers](https://developer.android.com/guide/components/services.html "服务  Android Developers")



## Service生命周期



启动Service的方式有两种，各自的生命周期也有所不同。   

一、通过startService启动Service：onCreate、onStartCommand、onDestory。  

二、通过bindService绑定Service：onCreate、onBind、onUnbind、onDestory。





## Service与Activity通信

* 通过 Binder
* 通过 Broadcast





## 如何保证Service在后台不被kill







## 系统服务类



[Android Service——系统服务类的使用 - 超级Peng - 博客园](http://www.cnblogs.com/PengLee/p/4092712.html "Android Service——系统服务类的使用 - 超级Peng - 博客园")

- 网络管理服务——ConnectivityManager
- 电话管理服务类——TelephonyManager
- 短信管理服务——SmsManager
- 音频管理服务类——AudioManager
- 振动器服务类——Vibrator
- 手机闹钟服务类——AlarmManager
- 通知服务类——Notification


