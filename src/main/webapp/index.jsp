<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<style>
:root{
    --bg:#f8fafc;
    --card:#fff;
    --primary:#0f172a;
    --accent:#3b82f6;
    --muted:#64748b;
    --border:#e2e8f0;
}

body{
    margin:0;
    font-family:Inter;
    background:var(--bg);
    color:var(--primary);
}

/* Header */
header{
    background:#fff;
    border-bottom:1px solid var(--border);
}
.container{
    max-width:1200px;
    margin:auto;
    padding:0 20px;
}
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 0;
}
.brand{
    font-weight:700;
    font-size:20px;
}
.brand span{color:var(--accent);}

.search input{
    padding:8px 12px;
    border-radius:20px;
    border:1px solid var(--border);
}

/* Hero */
.hero{
    text-align:center;
    padding:80px 20px;
    background:linear-gradient(135deg,#3b82f6,#6366f1);
    color:white;
}
.hero h1{font-size:40px;}
.btn{
    padding:12px 20px;
    border:none;
    border-radius:20px;
    cursor:pointer;
    margin:5px;
}
.btn-primary{
    background:white;
    color:black;
}

/* Sections */
.section{
    padding:50px 0;
}
.title{text-align:center;margin-bottom:30px;}

/* Grid */
.grid{
    display:grid;
    gap:20px;
}

/* Categories */
.categories{
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
}
.cat{
    background:white;
    padding:20px;
    border-radius:10px;
    text-align:center;
    border:1px solid var(--border);
}

/* Products */
.products{
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
}
.product{
    background:white;
    border-radius:10px;
    overflow:hidden;
    border:1px solid var(--border);
}
.product img{
    width:100%;
    height:200px;
    object-fit:cover;
}
.product-body{
    padding:15px;
}
.price{font-weight:700;}
.old{
    text-decoration:line-through;
    color:var(--muted);
}
.add{
    width:100%;
    padding:10px;
    background:var(--accent);
    color:white;
    border:none;
    cursor:pointer;
}

/* Footer */
footer{
    text-align:center;
    padding:30px;
    border-top:1px solid var(--border);
    color:var(--muted);
}
</style>
</head>

<body>

<header>
<div class="container header">
    <div class="brand">Nexus<span>Shop</span></div>
    <div class="search">
        <input id="search" placeholder="Search...">
    </div>
    <div>Cart: <span id="cart">0</span></div>
</div>
</header>

<section class="hero">
    <h1>Premium Collection</h1>
    <p>Modern shopping experience</p>
    <button class="btn btn-primary">Shop Now</button>
</section>

<section class="section container">
    <div class="title"><h2>Categories</h2></div>
    <div class="grid categories" id="cats"></div>
</section>

<section class="section container">
    <div class="title"><h2>Products</h2></div>
    <div class="grid products" id="products"></div>
</section>

<footer>
    © 2026 NexusShop
</footer>

<script>
const categories=["Phones","Laptops","Clothing","Shoes"];

const products=[
{title:"iPhone 14",price:1000,old:1200,img:"https://images.unsplash.com/photo-1511707171634-5f897ff02aa9"},
{title:"MacBook",price:2000,img:"https://images.unsplash.com/photo-1517336714731-489689fd1ca8"},
{title:"Shoes",price:150,img:"https://images.unsplash.com/photo-1542291026-7eec264c27ff"},
{title:"T-Shirt",price:30,img:"https://images.unsplash.com/photo-1521572163474-6864f9cf17ab"}
];

let cart=0;

const cats=document.getElementById("cats");
const prod=document.getElementById("products");

categories.forEach(c=>{
    cats.innerHTML+=`<div class="cat">${c}</div>`;
});

function render(list){
    prod.innerHTML="";
    list.forEach(p=>{
        prod.innerHTML+=`
        <div class="product">
            <img src="${p.img}">
            <div class="product-body">
                <h4>${p.title}</h4>
                <div class="price">$${p.price}</div>
                ${p.old?`<div class="old">$${p.old}</div>`:""}
            </div>
            <button class="add">Add to Cart</button>
        </div>`;
    });

    document.querySelectorAll(".add").forEach(btn=>{
        btn.onclick=()=>{
            cart++;
            document.getElementById("cart").innerText=cart;
        }
    });
}

render(products);

document.getElementById("search").oninput=(e)=>{
    const q=e.target.value.toLowerCase();
    render(products.filter(p=>p.title.toLowerCase().includes(q)));
};
</script>

</body>
</html>
