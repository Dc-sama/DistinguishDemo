function getObjectURL(file) {
    var url = null;
    if (window.createObjcectURL != undefined) {
        url = window.createOjcectURL(file);
    } else if (window.URL != undefined) {
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) {
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}
//使用方法
$("#file").change(function(){
    var file = this.files[0];
    var url = getObjectURL(file);//blob:http://doamin.com/5376c16a-02f9-489f-b30c-97a1808d5724
    console.log(url);
});