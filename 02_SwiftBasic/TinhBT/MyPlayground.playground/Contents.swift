
var str = "Hello, playground"

func tinhdientich(bankinh: Double) -> (dientich: Double,thetich: Double) {
    var dientich: Double = 0
    var thetich: Double = 0
    dientich = Double(4/3 * 3.14 * bankinh * bankinh * bankinh)
    thetich = Double(4 * 3.14 * bankinh * bankinh)
    return (dientich, thetich)
}

let dientich = tinhdientich(bankinh: 5)

//bai2
func tinhptbac2(a: Double ,b: Double ,c: Double) -> (x1: Double, x2: Double){
    var x1: Double = 0
    var x2: Double = 0
    
    var detar: Double = 0
    detar = b * b - (4 * a * c)
    if     detar < 0 {
        print("phuong trinh vo nghiem")
    }else if detar == 0 {
        let nghiemkep = -(b / 2 * a)
        print(nghiemkep)
    }else {
        x1 = (-b + detar.squareRoot()) / 2 * a
        x2 = (-b - detar.squareRoot()) / 2 * a
        print(x1 , x2)
    }
    
    return (x1, x2)
}

tinhptbac2(a: 2, b: 4, c: 2)
//bai 3
func bai3(a: Double,b: Double, c:Double,a1: Double,b1: Double,c1: Double)-> (x: Double, y:Double){
    var x: Double = 0
    var y: Double = 0
    var dx: Double = 0
    var dy: Double = 0
    var d: Double = 0
    d = a * b1 - a1 * b
    dx = c * b1 - c1 * b
    dy = a * c1 - a1 * c
    
    x = dx / d
    y = dy / d
    return(x , y)
}
    bai3(a: 2, b: 3, c: 4, a1: 3, b1: 4, c1: 5)

//bai4
func fibonaci(n: Int)
{
    var f1 = 1
    var f2 = 0
    var sum = 0

    for i in 0..<n
    {
        let f = f1 + f2
        f1 = f2
        f2 = f
        print("Fibonaci \(f2)")
        sum += f2
    }
    print("tong \(sum)")
}

 fibonaci(n: 10)
//    tinh sin cos
func chuoitaylor(x: Double , n: Int){
    var a = 0
    
}
















