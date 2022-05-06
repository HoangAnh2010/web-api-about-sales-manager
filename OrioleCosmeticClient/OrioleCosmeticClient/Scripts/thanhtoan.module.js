app.controller('thanhtoan', ($scope, $http) => {
    $scope.carts = [];
    if (localStorage.getItem('cart') != null) {
        $scope.carts = JSON.parse(localStorage.getItem('cart'));
        $scope.cartLen = $scope.carts.length;
    }

    $scope.log = () => {
        console.log($scope.lastname);
    }
    $http({
        url: 'http://localhost:44393/GioHang/loadGioHang',
        method: 'GET'
    }).then((res) => {
        console.log(res.data);
        $scope.carts = res.data;
    }, (err) => {
        console.log(err);
    });

    $scope.makePayment = () => {
        var items = [];
        for (var i = 0; i < $scope.carts.giohang.length; i++) {
            var item = {
                id_hoadon: null,
                id_sp: $scope.carts.giohang[i].ID,
                soluong: $scope.carts.giohang[i].SL,
                thanhtien: $scope.carts.giohang[i].Gia
            };
            items.push(item);
        }

        $http({
            url: 'https://localhost:44360/api/HoaDonBans/PostHoaDonBan',
            method: 'POST',
            data: {
                id_hoadon: null,
                ngaydat: null,
                hoten: $scope.hoten,
                diachinhanhang: $scope.address,
                sdt: $scope.phone,
                tongtientt: $scope.carts.tongtien,
                ChiTietHDBans: items
            }
        }).then((res) => {

        }, (err) => {
            console.log(err);
        });
    }

    $scope.pay = () => {
        $http({
            url: 'http://localhost:44393/NguoiDung/Authorize',
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