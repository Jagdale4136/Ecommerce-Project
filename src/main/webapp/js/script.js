function add_to_cart(pid, pname, price) {

	let cart = localStorage.getItem("cart");
	if (cart == null) {
		//no cart
		let products = [];
		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("product is added for the first time")
		showToast("Item is added to cart")
	}

	else {
		//cart is already present
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == pid)
		console.log(oldProduct)
		if (oldProduct) {
			//we have to increase the quantity..
			oldProduct.productQuantity = oldProduct.productQuantity + 1
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product quantity is increased ")
			showToast(oldProduct.productName+" quantity is increased")

		}
		else {
			//we have to add the product
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added ")
			showToast("product is added cart")
		}


	}
	updateCart();
}

//update cart

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);
	if (cart == null || cart.length == 0) {
		console.log(" Cart is empty!!");
		$(".cart-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any item</h3>");
		$(".checkout-btn").attr('disabled',true);
	}
	else {
		//
		console.log("cart");
		$(".cart-items").html(`(${cart.length})`);
		let table = `
			<table class='table'>
			<thead class='thread-light'>
			<tr>
			<th> Item name</th>
			<th> Price</th>
			<th> Quantity</th>
			<th>Total price</th>
			<th> Action</th>
			</tr>
			</thead>
			`;

		let totalPrice = 0;
		cart.map((item) => {
			table += `
				<tr>
				<td>${item.productName}</td>
				<td>${item.productPrice}</td>
				<td>${item.productQuantity}</td>
				<td>${item.productQuantity * item.productPrice}</td>
				<td><button onclick='deleteItemFromCart(${item.productId})'  class='btn btn-outline-danger'>Remove</button></td>
				
				</tr>
				
				`

			totalPrice += item.productPrice * item.productQuantity;

		})


		table = table +`
		
			<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price:${totalPrice}</td></tr>

		</table>`
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
	}

}


//Removing items from cart
function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));
	let newcart = cart.filter((item) => item.productId != pid)
	localStorage.setItem('cart',JSON.stringify(newcart))

  updateCart();
  showToast("product is removed from cart")
}


$(document).ready(function() {
	updateCart()
})


function showToast(message) {
  var toastContainer = document.getElementById('toast-container');
  toastContainer.innerHTML = message;
  toastContainer.style.display = 'block';
  setTimeout(function() {
    toastContainer.style.display = 'none';
  }, 3000); // hide the container after 3 seconds
}




function goToCheckout(){
	window.location="checkout.jsp"
}








