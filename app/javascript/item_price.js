window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price")|| document.createElement('input');
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor( inputValue / 10) ;
     const profitOnSale = document.getElementById("profit");
     profitOnSale.innerHTML = inputValue - addTaxDom.innerHTML;
  });
})