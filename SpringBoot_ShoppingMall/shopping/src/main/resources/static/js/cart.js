function addCart(param){
	return fetch('/cart/create',{
        method: 'post',
        body: JSON.stringify(param),
        headers: {'Content-Type': "application/json; charset=utf-8"}
        }) //post방식은 method,body,headers를 써줌
        .then(response => response.text())
        .catch(console.log);
}
