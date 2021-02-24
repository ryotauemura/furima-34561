window.addEventListener('load', () => {
  console.log(12344)
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
     const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor( inputValue * 0.1 )
     const addTax = document.getElementById("profit")
     num = Math.floor( inputValue * 0.1 )
     addTax.innerHTML = Math.floor(inputValue - num )  
  })

});


