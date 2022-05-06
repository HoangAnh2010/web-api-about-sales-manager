
app.controller('cart', ($scope, $http) => {


    $scope.carts = [];
    $scope.cartLen = 0;
    if (localStorage.getItem('cart') != null) {
        $scope.carts = JSON.parse(localStorage.getItem('cart'));
        $scope.cartLen = $scope.carts.length;
    }


    $scope.remove = (index) => {
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