window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor( inputValue / 10) ;
     const profitOnSale = document.getElementById("profit");
     profitOnSale.innerHTML = inputValue - addTaxDom.innerHTML;
    
  });
})