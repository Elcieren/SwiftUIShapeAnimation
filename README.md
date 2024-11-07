## CircleAnimateProgress
| Touch Circle Progress | 
|---------|
| <img src="https://github.com/user-attachments/assets/3de4910f-9e26-43f0-992e-2a616fb9cf7d" alt="Video 1" width="300"/> |


 <details>
    <summary><h2>Uygulamanın Amacı</h2></summary>
    Proje Amacı
   Bu kod, kullanıcıya dokunulduğunda animasyonla yüzde ilerlemesi gösteren iç içe geçmiş üç dairesel ilerleme göstergesi (circular progress indicators) oluşturur. Her dairenin yüzdesi dokunulduğunda belirli bir değere ayarlanır ve tekrar dokunulursa başlangıç değerine döner. Bu animasyonlu göstergeler, kullanıcı etkileşimi ile güncellenebilir.Bu kod, kullanıcıya tıklanabilir dairesel bir ilerleme göstergesi sunar. İç içe geçmiş üç daire, her biri farklı renklerde ve farklı yüzdelerle animasyonlu bir şekilde gösteriliyor. Kullanıcı her daireye tıkladığında, ilgili dairenin yüzdesi sıfırdan belirli bir değere yükseliyor veya tekrar sıfırlanıyor. CircularShape ile dairesel şekil oluşturulurken Circular yapısıyla görünüm düzenleniyor ve ContentView kullanıcı etkileşimini sağlıyor.
  </details>  


  <details>
    <summary><h2>CircularShape - Özel Şekil Yapısı</h2></summary>
     percent: Daire çemberinin yüzde kaçının dolu olduğunu belirler.
     startAngle: Yayın başlangıç açısını belirler.
     AnimatableData: percent değeri değiştiğinde, bu değeri animasyonla güncelleyebilmek için Shape’in animasyon desteğini sağlar.
     path(in rect: CGRect): Dairenin çemberini çizer ve startAngle ile endAngle arasında bir yay oluşturur. Bu fonksiyon, Path kullanarak daire şeklinin çizilmesini sağlar.

    
    ```
     struct CircularShape: Shape {
    var percent : Double
    var startAngle : Double
    
    typealias AnimatableData = Double
    var animatableData: Double {
        get { percent }
        set { percent = newValue }
    }
    
    init(percent: Double = 100, startAngle: Double = -90) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = self.percent / 100 * 360 + self.startAngle
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
    }



    ```
  </details> 

  <details>
    <summary><h2>Circular - Dairesel Görünüm Yapısı</h2></summary>
    lineWidth: Daire çizgisinin kalınlığını belirler.
    backgroundColor ve foregroundColor: Dairenin arka plan ve ön plan renklerini belirtir.
    percentage: Dairenin tamamlanma yüzdesini alır ve CircularShape ile bağlantılı olarak kullanılır.
    animation(.easeInOut(duration: 1.0), value: percentage): Bu satır, percentage değiştiğinde animasyonla güncellenmesini sağlar.
    
    ```
        struct Circular: View {
    let lineWidth: CGFloat
    let backgorundColor: Color
    let foregroundColor: Color
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CircularShape().stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgorundColor)
                CircularShape(percent: percentage).stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }
            .animation(.easeInOut(duration: 1.0), value: percentage)
            .padding(lineWidth / 1.5)
        }
    }
    }

    
    
    
    }



    
    ```
  </details> 


  <details>
    <summary><h2>ContentView - Kullanıcı Etkileşimi</h2></summary>
   Bu görünümde, üç Circular bileşeni iç içe eklenmiş durumda ve her biri farklı onTapGesture hareketlerine göre belirli bir yüzde değeri ile güncelleniyor:

   İlk daire mavi renkte ve 0 ile 50 arasında değişiyor.
   İkinci daire kırmızı renkte ve 0 ile 75 arasında değişiyor.
   Üçüncü daire yeşil renkte ve 0 ile 100 arasında değişiyor.
    
    ```
    struct ContentView: View {
    @State var firstCirclePercentage: Double = 0
    @State var secondCirclePercentage: Double = 0
    @State var threeCirclePercentage: Double = 0
    
    var body: some View {
        ZStack {
            Circular(lineWidth: 40, backgorundColor: Color.blue.opacity(0.2), foregroundColor: Color.blue, percentage: firstCirclePercentage)
                .frame(width: 350, height:  350)
                .onTapGesture {
                    if self.firstCirclePercentage == 0 {
                        self.firstCirclePercentage = 50
                    } else {
                        self.firstCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgorundColor: Color.red.opacity(0.2), foregroundColor: Color.red, percentage: secondCirclePercentage)
                .frame(width: 250, height:  250)
                .onTapGesture {
                    if self.secondCirclePercentage == 0 {
                        self.secondCirclePercentage = 75
                    } else {
                        self.secondCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgorundColor: Color.green.opacity(0.2), foregroundColor: Color.green, percentage: threeCirclePercentage)
                .frame(width: 150, height:  150)
                .onTapGesture {
                    if self.threeCirclePercentage == 0 {
                        self.threeCirclePercentage = 100
                    } else {
                        self.threeCirclePercentage = 0
                    }
                }
        }
     }
    }



    ```
  </details> 


<details>
    <summary><h2>Uygulama Görselleri </h2></summary>
    
    
 <table style="width: 100%;">
    <tr>
        <td style="text-align: center; width: 16.67%;">
            <h4 style="font-size: 14px;">Tıklanmamış Görünüm</h4>
            <img src="https://github.com/user-attachments/assets/6c399a9d-5d4c-47da-b316-9f8cd9c987e3" style="width: 100%; height: auto;">
        </td>
        <td style="text-align: center; width: 16.67%;">
            <h4 style="font-size: 14px;">Dış Çember Anımasyon<</h4>
            <img src="https://github.com/user-attachments/assets/d60047bd-4751-4a93-8c87-2dfbcb324bee" style="width: 100%; height: auto;">
        </td>
              <td style="text-align: center; width: 16.67%;">
            <h4 style="font-size: 14px;">Iç Cember Anımasyon<</h4>
            <img src="https://github.com/user-attachments/assets/8ebdb223-6b1c-46fe-b74d-8a633eb80bd1" style="width: 100%; height: auto;">
        </td>
              <td style="text-align: center; width: 16.67%;">
            <h4 style="font-size: 14px;">Merkez Çember Anımasyon<</h4>
            <img src="https://github.com/user-attachments/assets/16043cb0-c7cb-4336-ad71-b098acb62abd" style="width: 100%; height: auto;">
        </td>
    </tr>
</table>
  </details> 
