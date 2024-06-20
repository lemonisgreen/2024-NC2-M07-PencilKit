# 2024-NC2-M07-PencilKit
라일리✨와 레모니🍋가 함께👩🏻‍❤️‍👩🏻 만든 인체🧠 드로잉✍️ 노트🗒️

## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About PencilKit

✏️PencilKit은 Apple이 iOS와 iPadOS에 도입한 프레임워크로, 사용자에게 펜슬 도구 및 손쉬운 스케치 및 드로잉 기능을 제공하는 도구입니다.

- **PKCanvasView**
  
  PKCanvasView는 드로잉을 위한 캔버스를 제공하는 UIView입니다.

- **PKToolpicker**

    사용자 인터페이스에 드로잉 도구를 제공하는 UI 컴포넌트입니다.

 - **PKDrawing**
   
   - 객체는 벡터 데이터로 드로잉을 저장하므로, 크기 조정 및 변형이 가능합니다.
   - PKCanvasView의 드로잉 데이터는 PKDrawing 객체로 관리됩니다.


## 🎯 What we focus on?
<img width="876" alt="drawing4" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/d2c337c0-adc5-4602-9e01-68896064e0bf">

**우리의 목표는 드로잉용도로 PencilKit 사용하기!**

도안을 넣어서 드로잉 할 수 있는 인체 드로잉노트🗒️를 기본 PencilKit✏️을 이용해서 구현하기!


## 💼 Use Case
**인체를 그리고 싶은 유저에게쉽게 드로잉 연습을 하게해주자!**
>User type: 만화를 잘 그리고 싶거나, 인체를 잘 그리고 싶거나, 혹은 의료계지망생


## 🖼️ Prototype

</br>

<img width="280" alt="Simulator Screenshot - iPad (10th generation) - 2024-06-20 at 11 49 58" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/a7d29048-898a-4596-8db4-e08540e6db74">
<img width="280" alt="Simulator Screenshot - iPad (10th generation) - 2024-06-20 at 11 49 42" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/c2d58398-4bbc-4add-b7df-f36d34d588cf">

</br>

따라 그리고 싶은 드로잉 도안을 선택한다.

</br>

<img width="280" alt="Simulator Screenshot - iPad (10th generation) - 2024-06-20 at 11 49 58" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/5774cd36-5133-4c6b-b0c2-1b575240ecd2">
<img width="280" alt="Simulator Screenshot - iPad (10th generation) - 2024-06-20 at 11 49 42" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/8d946229-7be1-495b-9562-d88f64d80b11">

</br>

도안을 껐다 켰다 하면서 도안을 따라 드로잉 연습을 할 수 있다.
</br>

## 🛠️ About Code
- pencilKit에서 pencilKit canvas를 불러오는 코드
- 
  ```swift
 
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.isOpaque = false
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        
    }
  ```
- pencilKit에서 ToolPicker를 불러오는 코드
- 
  ```swift
 
    func showToolPicker() {
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
  ```

## 이 두가지 코드만 있으면 pencilKit의 가장 친숙한 모습인 Canvas에 ToolPicker가 뜨는 모양으로 구현할 수 있다.##

<img width="300" alt="Simulator Screenshot - iPad (10th generation) - 2024-06-20 at 11 49 58" src="https://github.com/lemonisgreen/2024-NC2-M07-PencilKit/assets/138443851/632ef139-c166-444f-a66a-5d13d8d1d53f">

