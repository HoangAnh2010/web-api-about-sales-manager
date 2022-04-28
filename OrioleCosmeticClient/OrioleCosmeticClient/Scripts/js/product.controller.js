// đối với mỗi một trang nên dùng 1 controller
app.controller('product', ($scope, $http, SearchResponse) => {
     //các chức năng thì được code dước dạng hàm
    // các biến khai báo thoải mái đi
    $scope.products = [];
    $scope.key = window.sessionStorage.getItem('product_name');

    if ($scope.key == null || $scope.key == '')
        $http({
            url: 'https://localhost:44360/api/SanPhams/',
            method: 'GET'
        }).then((res) => {
            console.log(res.data);
            console.log($scope.products);
            console.log("helo");
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

numberWithCommas(x) {
    if (x) {
        return this.replaceNumber(x.toString().split(",").join(''));
    } else {
        return '0';
    }
}

replaceNumber(x) {
    return x.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}