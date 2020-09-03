window.addEventListener('load', function(){

  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  itemPrice.addEventListener('input', function() {
    const price = itemPrice.value
    if (price.match(/^[0-9]*$/)) {
      tax = price / 10 | 0;
      addTaxPrice.innerHTML = tax;
      pro = price * 9 / 10 | 0;
      profit.innerHTML = pro;
    } else {
      word = "NaN";
      addTaxPrice.innerHTML = word;
      profit.innerHTML = word;
    }
  });
});