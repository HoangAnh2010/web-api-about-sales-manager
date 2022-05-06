app.controller('thanhtoan', ($scope, $http) => {
    $scope.carts = [];
    if (localStorage.getItem('cart') != null) {
        $scope.carts = JSON.parse(localStorage.getItem('cart'));
        $scope.cartLen = $scope.carts.length;
    }

    $scope.log = () => {
        console.log($scope.lastname);
    }

    $scope.tongTien = () => {
        let s = 0;
        for (let c of $scope.carts)
            s += c.sl_mua * c.gia;
        return s;
    }

    $scope.makePayment = () => {
        var items = [];
        for (var i = 0; i < $scope.carts.length; i++) {
            var item = {
                mahd: null,
                masp: $scope.carts[i].masp,
                soluong: $scope.carts[i].sl_mua,
                thanhtien: $scope.carts[i].sl_mua * $scope.carts[i].gia
            };
            items.push(item);
        }
        console.log(items);
        $http({
            url: 'https://localhost:44360/api/HoaDonBans/PostHoaDonBan',
            method: 'POST',
            data: {
                id_hoadon: null,
                ngaydat: null,
                hoten: $scope.name,
                diachinhanhang: $scope.address,
                sdt: $scope.phone,
                tongtientt: $scope.tongTien(),
                chiTietHDBans: items
            }
        }).then((res) => {

        }, (err) => {
            console.log(err);
        });
    }

    $scope.pay = () => {
        $http({
            url: 'https://localhost:44393/NguoiDung/Authorize',
            method: 'GET'
        }).then((res) => {
            if (res.data == "True") {
                $scope.makePayment();
            } else {
                alert("Bạn cần đăng nhập trước khi mua hàng");
            }
        })
    }

   
});