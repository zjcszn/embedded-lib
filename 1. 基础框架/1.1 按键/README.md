# 按键框架

## 1.multi button

事件驱动的按键库，采用状态机实现，参考了以下开源项目：
MultiButton : github.com/0x1abin/MultiButton

在原项目基础上增加了FIFO事件推送功能，并提供更多的按键功能配置选项，可自定义每个按键的连击、长按功能。

## 2.simple button

轻量级按键库，解耦了硬件与应用层，硬件层扫描并记录按键状态，应用层处理按键事件，支持长按及组合按键。
