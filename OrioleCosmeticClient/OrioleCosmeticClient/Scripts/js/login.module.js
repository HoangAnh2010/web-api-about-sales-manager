
app.controller('login', ($scope, $http) => {
    $scope.account = "";
    $scope.password = "";

    $scope.login = () => {
        $http({
            method: 'POST',
            url: 'https://localhost:44393/NguoiDung/login',
            params: {
                account: $scope.account,
                password: $scope.password
            }
        }).then((res) => {
            console.log(res.data);
            if (res.data == "True")
                alert("Đăng nhập thành công");
            else {
                alert("Sai email hoặc mật khẩu");
            }
        }, (err) => {
            console.log("error: ");
            console.log(err);
        });
    }

    $scope.signIn = () => {
        $http({
            method: 'POST',
            url: 'https://localhost:44360/api/NguoiDungs/PostNguoiDung',
            data: {
                hoten: $scope.name,
                email: $scope.email,
                matkhau: $scope.password,
                sdt: $scope.phone,
                diachi: $scope.address
            }
        }).then((res) => {
            if (res.status == 200)
                alert("Đăng ký thành công");
            else {
                alert("Đăng ký thất bại");
            }
        }, (err) => {

        });
    }

    
});