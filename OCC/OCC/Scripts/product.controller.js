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

});