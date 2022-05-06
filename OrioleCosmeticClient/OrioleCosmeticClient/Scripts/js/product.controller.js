// đối với mỗi một trang nên dùng 1 controller
app.controller('product', ($scope, $http, SearchResponse) => {
     //các chức năng thì được code dước dạng hàm
    $scope.products = [];
    $scope.key = window.sessionStorage.getItem('product_name');
    $scope.carts = [];
    $scope.cartLen = 0;
    if (localStorage.getItem('cart') != null) {
        $scope.carts = JSON.parse(localStorage.getItem('cart'));
        $scope.cartLen = $scope.carts.length;
    }
    
    if ($scope.key == null || $scope.key == '')
        $http({
            url: 'https://localhost:44360/api/SanPhams/',
            method: 'GET'
        }).then((res) => {
            console.log(res);
            $scope.products = res.data;           
        }, (err) => {
            console.log(err);
        });
    else
        $http({
            url: 'https://localhost:44360/api/SanPhams/GetSanPhamTheoTen',
            method: 'GET',
            params: {
                tensp: $scope.key
            }
        }).then((res) => {
            $scope.products = res.data;
        }, (err) => {
            console.log(err);
        });
    $scope.muaHang = (index) => {
        let product = $scope.products[index];
        if (product.soluong < 1)
            return;
        let cart_string = localStorage.getItem("cart");
        if (cart_string == null || cart_string == '')
            localStorage.setItem("cart", '[]');
        let cart = JSON.parse(localStorage.getItem("cart"));
        let added = cart.find(x => x.masp == product.masp);
        if (added == undefined) {
            cart.push({
                masp: product.masp,
                ten: product.tensp,
                anh: product.anh,
                gia: product.dongia,
                sl_mua: 1,
                sl: product.soluong
            });
        } else {
            added.sl_mua += 1;
            if (added.sl_mua > product.soluong) {
                return;
            }
        }
        $scope.carts = cart;
        console.log($scope.carts);
        let json_cart = JSON.stringify(cart);
        localStorage.setItem('cart', json_cart);
    }

    $scope.plus = (index) => {
        let product = $scope.carts[index];
        if (product.sl_mua + 1 > product.sl)
            return;
        product.sl_mua += 1;
        let json_cart = JSON.stringify($scope.carts);
        localStorage.setItem('cart', json_cart);
    }

    $scope.minus = (index) => {
        let product = $scope.carts[index];
        if (product.sl_mua - 1 <= 0)
            $scope.carts.splice(index, 1);
        product.sl_mua -= 1;
        let json_cart = JSON.stringify($scope.carts);
        localStorage.setItem('cart', json_cart);
    }

    $scope.removeCartItem = (index) => {
        $scope.carts.splice(index, 1);
        let json_cart = JSON.stringify($scope.carts);
        localStorage.setItem('cart', json_cart);
    }


    $scope.tongTien = () => {
        let s = 0;
        for (let c of $scope.carts)
            s += c.sl_mua * c.gia;
        return s;
    }


});