var app = angular.module('shopping', []);
// phần bên dưới này để viết các hàm dùng chung

//viết service để nhận kết quả trả vềgiwuax ccs controller
app.service('SearchResponse', function () {
    var property = 'result';

    return {
        getProperty: function () {
            return property;
        },
        setProperty: function (value) {
            property = value;
        }
    };
});